package org.openexercise

class Exercise {

    String name
    String description
    String instructions

    static constraints = {
        name nullable: false, blank: false
        description nullable: false, blank:  false
        instructions nullable: false, blank:  true
    }
}
