package org.openexercise

class Exercise {

    String name
    String description
    String instructions
    Image image

    static belongsTo = [exerciseType:ExerciseType]

    static constraints = {
        name nullable: false, blank: false
        description nullable: false, blank:  false
        instructions nullable: false, blank:  true
        image nullable: true; blank: false
    }
}
