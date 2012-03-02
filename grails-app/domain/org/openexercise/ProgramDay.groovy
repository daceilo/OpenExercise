package org.openexercise

class ProgramDay {
    String dayOfWeek
    
    static belongsTo = [program:Program]
    static hasMany = [exerciseBundles:ExerciseBundle]

    static constraints = {
        dayOfWeek nullable: false, blank: false
        exerciseBundles nullable: true, blank: true
    }

    static mapping = {
        exerciseBundles sort: 'id'
    }

    String toString() {
        dayOfWeek
    }
}
