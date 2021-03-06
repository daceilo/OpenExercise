package org.openexercise

class User {

    transient springSecurityService

    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired
    Float startingWeight
    
    static hasMany = [programs:Program, blogEntries: BlogEntry, exerciseEntries: ExerciseEntry]

    static mappedBy = [programs:'athlete']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        programs nullable: true, blank: true
        blogEntries  nullable: true, blank: true
        exerciseEntries nullable: true, blank: true
        startingWeight nullable: true, blank: true
    }
    
    String toString() {
        username
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
