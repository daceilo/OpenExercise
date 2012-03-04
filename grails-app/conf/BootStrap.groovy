import grails.util.Environment
import org.apache.commons.io.IOUtils
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.openexercise.ExerciseType
import org.openexercise.Exercise
import org.openexercise.Image
import java.awt.image.BufferedImage
import javax.imageio.ImageIO
import org.imgscalr.Scalr
import org.openexercise.Program
import org.openexercise.ExerciseBundle
import org.openexercise.Role
import org.openexercise.User
import org.openexercise.UserRole


class BootStrap {

    def init = { servletContext ->
        // For all environments, we want to setup our security
        def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(flush:true, failOnError: true)
        def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: "ROLE_ADMIN").save(flush:true, failOnError:true)

        // Will be added if they don't exist
        def baseUsers = [
                'admin' : adminRole,
                'user'  : userRole
        ]

        // If the users don't exist, then add the default ones
        def users = User.list()
        if (!users) {
            baseUsers.each { username, role ->
                def user = new User(
                        username: username,
                        password: 'password',
                        enabled: true).save(flush:true, failOnError: true)

                UserRole.create user, role, true

            }


        }

        // Make sure there are at least one user, two roles and one userrole
        assert User.count() >= 1
        assert Role.count() >= 2
        assert UserRole.count() >= 1

        switch (Environment.current) {
        // For dev environment, populate some data on start
            case Environment.DEVELOPMENT:

                //Add in the appropriate exercises
                // TODO simplify the bootstrap, this is crazy messy.
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

                    // Add in chest press gif
                    def file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource("classpath:resources/chest-press.jpg").inputStream)

                    // Create the thumbnail and convert back to bytearray
                    BufferedImage thumbnail = Scalr.resize(ImageIO.read(new ByteArrayInputStream(file)),
                            99, 99, null);
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(thumbnail, "jpg", baos);
                    baos.flush();
                    def thumbnailArray = baos.toByteArray();
                    baos.close();

                    def chestPressGif = new Image(data: file, fileName: "chest-press.jpg",
                            size: file.size(), type: "jpg", exercise: exerciseTwo).save(flush: true,
                            failOnError: true)
                    def chestPressThumbnail = new Image(
                            data: thumbnailArray, fileName: "chest-press-thumbnail.jpg",
                            size: thumbnailArray.size(), type: "jpg", exercise: exerciseTwo).save(flush: true,
                            failOnError: true)

                    exerciseTwo.image = chestPressGif
                    exerciseTwo.thumbnail = chestPressThumbnail
                    exerciseTwo.save(flush: true, failOnError: true)

                    // Add in running jpg
                    file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource("classpath:resources/running.jpg").inputStream)

                    // Create the thumbnail and convert back to bytearray
                    thumbnail = Scalr.resize(ImageIO.read(new ByteArrayInputStream(file)),
                            99, 99, null);
                    baos = new ByteArrayOutputStream();
                    ImageIO.write(thumbnail, "jpg", baos);
                    baos.flush();
                    thumbnailArray = baos.toByteArray();
                    baos.close();

                    def runningJpg = new Image(data: file, fileName: "running.jpg",
                            size: file.size(), type: "jpg", exercise: exerciseOne).save(flush: true,
                            failOnError: true)

                    def runningThumbnail = new Image(
                            data: thumbnailArray, fileName: "running-thumbnail.jpg",
                            size: thumbnailArray.size(), type: "jpg", exercise: exerciseOne).save(flush: true,
                            failOnError: true)

                    exerciseOne.image = runningJpg
                    exerciseOne.thumbnail = runningThumbnail
                    exerciseOne.save(flush: true, failOnError: true)

                    // Add in jump rope jpg
                    file = IOUtils.toByteArray(ApplicationHolder.application.parentContext.getResource("classpath:resources/jumprope.jpg").inputStream)

                    // Create the thumbnail and convert back to bytearray
                    thumbnail = Scalr.resize(ImageIO.read(new ByteArrayInputStream(file)),
                            99, 99, null);
                    baos = new ByteArrayOutputStream();
                    ImageIO.write(thumbnail, "jpg", baos);
                    baos.flush();
                    thumbnailArray = baos.toByteArray();
                    baos.close();

                    def jumpRopeJpg = new Image(data: file, fileName: "jumprope.jpg",
                            size: file.size(), type: "jpg", exercise: exerciseThree).save(flush: true,
                            failOnError: true)

                    def jumpRopeThumbnail = new Image(
                            data: thumbnailArray, fileName: "jumprope-thumbnail.jpg",
                            size: thumbnailArray.size(), type: "jpg", exercise: exerciseThree).save(flush: true,
                            failOnError: true)

                    exerciseThree.image = jumpRopeJpg
                    exerciseThree.thumbnail = jumpRopeThumbnail
                    exerciseThree.save(flush: true, failOnError: true)

                    typeOne.addToExercicses(exerciseOne).save(flush: true, failOnError: true)
                    typeTwo.addToExercicses(exerciseTwo).save(flush: true, failOnError: true)
                    typeOne.addToExercicses(exerciseThree).save(flush: true, failOnError: true)
                    
                    def programOne = new Program()
                    programOne.monday.program = programOne
                    programOne.tuesday.program = programOne
                    programOne.wednesday.program = programOne
                    programOne.thursday.program = programOne
                    programOne.friday.program = programOne
                    programOne.saturday.program = programOne
                    programOne.sunday.program = programOne
                    programOne.createdBy = User.findByUsername("admin")

                    programOne.save(flush: true, failOnError: true)

                    def exerciseBundleOne = new ExerciseBundle(exercise: exerciseOne, repetitions: 3,
                            durationInSeconds: null, programDay: programOne.monday)
                    programOne.monday.addToExerciseBundles(exerciseBundleOne).save(flush: true, failOnError: true)

                    def exerciseBundleTwo = new ExerciseBundle(exercise: exerciseOne, repetitions: 3,
                            durationInSeconds: null, programDay: programOne.wednesday)
                    programOne.wednesday.addToExerciseBundles(exerciseBundleTwo).save(flush: true, failOnError: true)

                    def exerciseBundleThree = new ExerciseBundle(exercise: exerciseOne, repetitions: null,
                            durationInSeconds: 3600, programDay: programOne.saturday)
                    programOne.saturday.addToExerciseBundles(exerciseBundleThree).save(flush: true,
                            failOnError: true)
                }
                break
        }
    }
    def destroy = {
    }
}
