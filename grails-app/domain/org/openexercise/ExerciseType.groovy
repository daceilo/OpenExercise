package org.openexercise

class ExerciseType {
    String name
    String description
    
    static hasMany = [exercicses:Exercise]

    static constraints = {
        name nullable: false, blank: false
        description nullable: true, blank: true
    }
}
