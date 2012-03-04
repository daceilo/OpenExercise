package org.openexercise

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ProgramDayController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [programDayInstanceList: ProgramDay.list(params), programDayInstanceTotal: ProgramDay.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [programDayInstance: new ProgramDay(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def programDayInstance = new ProgramDay(params)
        if (!programDayInstance.save(flush: true)) {
            render(view: "create", model: [programDayInstance: programDayInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), programDayInstance.id])
        redirect(action: "show", id: programDayInstance.id)
    }

    def show() {
        def programDayInstance = ProgramDay.get(params.id)
        if (!programDayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "list")
            return
        }

        [programDayInstance: programDayInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit() {
        def programDayInstance = ProgramDay.get(params.id)
        if (!programDayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "list")
            return
        }

        [programDayInstance: programDayInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update() {
        def programDayInstance = ProgramDay.get(params.id)
        if (!programDayInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (programDayInstance.version > version) {
                programDayInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'programDay.label', default: 'ProgramDay')] as Object[],
                          "Another user has updated this ProgramDay while you were editing")
                render(view: "edit", model: [programDayInstance: programDayInstance])
                return
            }
        }

        programDayInstance.properties = params

        if (!programDayInstance.save(flush: true)) {
            render(view: "edit", model: [programDayInstance: programDayInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), programDayInstance.id])
        redirect(action: "show", id: programDayInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete() {
        def programDayInstance = ProgramDay.get(params.id)
        if (!programDayInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "list")
            return
        }

        try {
            programDayInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'programDay.label', default: 'ProgramDay'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
