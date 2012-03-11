package org.openexercise

class User {

    transient springSecurityService

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    
    static hasMany = [programs:Program, entries: Entry, exerciseEntries: ExerciseEntry]

    static mappedBy = [programs:'athlete']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        programs nullable: true, blank: true
        entries  nullable: true, blank: true
        exerciseEntries nullable: true, blank: true
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
