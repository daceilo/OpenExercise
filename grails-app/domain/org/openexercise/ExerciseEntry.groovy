package org.openexercise

class ExerciseEntry extends Entry {
    static belongsTo = [user:User, exerciseBundle: ExerciseBundle]

    static constraints = {

    }
}
