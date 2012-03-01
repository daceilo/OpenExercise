package org.openexercise

import org.springframework.dao.DataIntegrityViolationException

class ExerciseBundleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exerciseBundleInstanceList: ExerciseBundle.list(params), exerciseBundleInstanceTotal: ExerciseBundle.count()]
    }

    def create() {
        [exerciseBundleInstance: new ExerciseBundle(params)]
    }
    
    def createFromExercise() {
        log.debug("Received: exercise.id = " + params.exercise.id + " programDay.id = " +
                params.programDay.id + " program.id = " + params.program.id)

        def newExerciseBundles = new ExerciseBundle(exercise: Exercise.get(params.exercise.id), repetitions: 0,
                durationInSeconds: 0, programDay: ProgramDay.get(params.programDay.id)).save(flush: true,
                failOnError: true)

        return newExerciseBundles.id
    }

    def save() {
        def exerciseBundleInstance = new ExerciseBundle(params)
        if (!exerciseBundleInstance.save(flush: true)) {
            render(view: "create", model: [exerciseBundleInstance: exerciseBundleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), exerciseBundleInstance.id])
        redirect(action: "show", id: exerciseBundleInstance.id)
    }

    def show() {
        def exerciseBundleInstance = ExerciseBundle.get(params.id)
        if (!exerciseBundleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseBundleInstance: exerciseBundleInstance]
    }

    def edit() {
        def exerciseBundleInstance = ExerciseBundle.get(params.id)
        if (!exerciseBundleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseBundleInstance: exerciseBundleInstance]
    }

    def update() {
        def exerciseBundleInstance = ExerciseBundle.get(params.id)
        if (!exerciseBundleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (exerciseBundleInstance.version > version) {
                exerciseBundleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'exerciseBundle.label', default: 'ExerciseBundle')] as Object[],
                        "Another user has updated this ExerciseBundle while you were editing")
                render(view: "edit", model: [exerciseBundleInstance: exerciseBundleInstance])
                return
            }
        }

        exerciseBundleInstance.properties = params

        if (!exerciseBundleInstance.save(flush: true)) {
            render(view: "edit", model: [exerciseBundleInstance: exerciseBundleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), exerciseBundleInstance.id])
        redirect(action: "show", id: exerciseBundleInstance.id)
    }

    def delete() {
        def exerciseBundleInstance = ExerciseBundle.get(params.id)
        if (!exerciseBundleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "list")
            return
        }

        try {
            exerciseBundleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
