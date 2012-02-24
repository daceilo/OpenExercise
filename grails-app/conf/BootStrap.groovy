import grails.util.Environment
import org.apache.commons.io.IOUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.openexercise.ExerciseType
import org.openexercise.Exercise

class BootStrap {

    def init = { servletContext ->
        switch (Environment.current) {
        // For dev environment, populate some data on start
            case Environment.DEVELOPMENT:

                //Add in the appropriate exercises
                if (!ExerciseType.count()) {
                    // Create exercise type
                    def typeOne = new ExerciseType(name: "Cardio", description: "Cardio Exercises").save(flush: true,
                            failOnError: true)
                    def typeTwo = new ExerciseType(name: "Weight lifting", description: "All free weight exercises")
                            .save(flush: true, failOnError: true)

                    // Create a contract
                    def exerciseOne = new Exercise(name: "Jog", description: "Jog at a moderate pace",
                            instructions: "Put on shoes and run",
                            exerciseType: typeOne).save(flush: true, failOnError: true)
                    def exerciseTwo = new Exercise(name: "Chest press",
                            description: "Chest press is with free weights",
                            instructions: "Lay flat on back, push up with weights",
                            exerciseType: typeTwo).save(flush: true,
                            failOnError: true)
                    def exerciseThree = new Exercise(name: "Jump Rope",
                            description: "Jumping over a rope",
                            instructions: "Swing jump rope over head, jump over, repeat",
                            exerciseType: typeOne).save(flush: true, failOnError: true)

                    typeOne.addToExercicses(exerciseOne).save(flush: true, failOnError: true)
                    typeTwo.addToExercicses(exerciseTwo).save(flush: true, failOnError: true)
                    typeOne.addToExercicses(exerciseThree).save(flush: true, failOnError: true)
                }
                break
        }
    }
    def destroy = {
    }
}
