import grails.util.Environment
import org.apache.commons.io.IOUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.openexercise.ExerciseType
import org.openexercise.Exercise
import org.openexercise.Image

class BootStrap {

    def init = { servletContext ->
        switch (Environment.current) {
        // For dev environment, populate some data on start
            case Environment.DEVELOPMENT:

                //Add in the appropriate exercises
                if (!ExerciseType.count()) {
                    def fileToLoad = "resources/chest-press.gif"

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

                    // Add in chest press gif
                    def file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource
                    ("classpath:$fileToLoad").inputStream)
                    def chestPressGif = new Image(data: file, fileName: "chest-press.gif",
                            size: file.size(), type: "gif", exercise: exerciseTwo).save(flush: true,
                            failOnError: true)

                    exerciseTwo.image = chestPressGif
                    exerciseTwo.save(flush: true, failOnError: true)

                    // Add in running jpg
                    file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource
                    ("classpath:resources/running.jpg").inputStream)
                    def runningJpg = new Image(data: file, fileName: "running.jpg",
                            size: file.size(), type: "jpg", exercise: exerciseOne).save(flush: true,
                            failOnError: true)
                    exerciseOne.image = runningJpg
                    exerciseOne.save(flush: true, failOnError: true)

                    // Add in jump rope jpg
                    file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource
                    ("classpath:resources/jumprope.jpg").inputStream)
                    def jumpRopeJpg = new Image(data: file, fileName: "jumprope.jpg",
                            size: file.size(), type: "jpg", exercise: exerciseThree).save(flush: true,
                            failOnError: true)
                    exerciseThree.image = jumpRopeJpg
                    exerciseThree.save(flush: true, failOnError: true)

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
