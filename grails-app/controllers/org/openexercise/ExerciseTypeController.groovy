package org.openexercise

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ExerciseTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [exerciseTypeInstanceList: ExerciseType.list(params), exerciseTypeInstanceTotal: ExerciseType.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [exerciseTypeInstance: new ExerciseType(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def exerciseTypeInstance = new ExerciseType(params)
        if (!exerciseTypeInstance.save(flush: true)) {
            render(view: "create", model: [exerciseTypeInstance: exerciseTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), exerciseTypeInstance.id])
        redirect(action: "show", id: exerciseTypeInstance.id)
    }

    def show() {
        def exerciseTypeInstance = ExerciseType.get(params.id)
        if (!exerciseTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseTypeInstance: exerciseTypeInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit() {
        def exerciseTypeInstance = ExerciseType.get(params.id)
        if (!exerciseTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "list")
            return
        }

        [exerciseTypeInstance: exerciseTypeInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update() {
        def exerciseTypeInstance = ExerciseType.get(params.id)
        if (!exerciseTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (exerciseTypeInstance.version > version) {
                exerciseTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'exerciseType.label', default: 'ExerciseType')] as Object[],
                        "Another user has updated this ExerciseType while you were editing")
                render(view: "edit", model: [exerciseTypeInstance: exerciseTypeInstance])
                return
            }
        }

        exerciseTypeInstance.properties = params

        if (!exerciseTypeInstance.save(flush: true)) {
            render(view: "edit", model: [exerciseTypeInstance: exerciseTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), exerciseTypeInstance.id])
        redirect(action: "show", id: exerciseTypeInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete() {
        def exerciseTypeInstance = ExerciseType.get(params.id)
        if (!exerciseTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            exerciseTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exerciseType.label', default: 'ExerciseType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
