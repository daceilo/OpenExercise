package org.openexercise

class Entry {

    Date dateCreated
    Date lastUpdated
    Float sleepTime
    Float weight

    static belongsTo = [user: User]

    static mapping = {
        autoTimestamp true
    }

    static constraints = {
        sleepTime nullable: true, blank: true
        weight nullable: true, blank: true
    }
}
