package org.openexercise

class ExerciseBundle {
    Exercise exercise
    Integer repetitions
    Integer durationInSeconds

    static belongsTo = [programDay:ProgramDay]
    
    static constraints = {
        exercise nullable: false, blank: false
        repetitions nullable: true, blank: true
        durationInSeconds nullable: true, blank: true
    }
    
    String toString() {
        exercise.toString() + ": " + repetitions.toString() + " time(s) - " + durationInSeconds.toString() + " seconds"
    }
}
