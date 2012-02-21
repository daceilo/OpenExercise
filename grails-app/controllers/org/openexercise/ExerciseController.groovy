package org.openexercise

import org.springframework.dao.DataIntegrityViolationException

class ExerciseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exerciseInstanceList: Exercise.list(params), exerciseInstanceTotal: Exercise.count()]
    }

    def create() {
        [exerciseInstance: new Exercise(params)]
    }

    def save() {
        def exerciseInstance = new Exercise(params)
        if (!exerciseInstance.save(flush: true)) {
            render(view: "create", model: [exerciseInstance: exerciseInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'exercise.label', default: 'Exercise'), exerciseInstance.id])
        redirect(action: "show", id: exerciseInstance.id)
    }

    def show() {
        def exerciseInstance = Exercise.get(params.id)
        if (!exerciseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseInstance: exerciseInstance]
    }

    def edit() {
        def exerciseInstance = Exercise.get(params.id)
        if (!exerciseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseInstance: exerciseInstance]
    }

    def update() {
        def exerciseInstance = Exercise.get(params.id)
        if (!exerciseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (exerciseInstance.version > version) {
                exerciseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'exercise.label', default: 'Exercise')] as Object[],
                          "Another user has updated this Exercise while you were editing")
                render(view: "edit", model: [exerciseInstance: exerciseInstance])
                return
            }
        }

        exerciseInstance.properties = params

        if (!exerciseInstance.save(flush: true)) {
            render(view: "edit", model: [exerciseInstance: exerciseInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'exercise.label', default: 'Exercise'), exerciseInstance.id])
        redirect(action: "show", id: exerciseInstance.id)
    }

    def delete() {
        def exerciseInstance = Exercise.get(params.id)
        if (!exerciseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "list")
            return
        }

        try {
            exerciseInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exercise.label', default: 'Exercise'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
