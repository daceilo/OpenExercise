package org.openexercise

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class ProgramController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [programInstanceList: Program.list(params), programInstanceTotal: Program.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        // Create all the days, then create the program, then save and flush
        def program = new Program()
        program.monday.program = program
        program.tuesday.program = program
        program.wednesday.program = program
        program.thursday.program = program
        program.friday.program = program
        program.saturday.program = program
        program.sunday.program = program
        program.createdBy = springSecurityService.currentUser

        program.save(flush: true, failOnError: true)

        [programInstance: program]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        def programInstance = new Program(params)
        if (!programInstance.save(flush: true)) {
            render(view: "create", model: [programInstance: programInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'program.label', default: 'Program'), programInstance.id])
        redirect(action: "show", id: programInstance.id)
    }

    def show() {
        def programInstance = Program.get(params.id)
        if (!programInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "list")
            return
        }

        [programInstance: programInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit() {
        def programInstance = Program.get(params.id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "list")
            return
        }

        [programInstance: programInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update() {
        def programInstance = Program.get(params.id)
        if (!programInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (programInstance.version > version) {
                programInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'program.label', default: 'Program')] as Object[],
                          "Another user has updated this Program while you were editing")
                render(view: "edit", model: [programInstance: programInstance])
                return
            }
        }

        programInstance.properties = params

        if (!programInstance.save(flush: true)) {
            render(view: "edit", model: [programInstance: programInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'program.label', default: 'Program'), programInstance.id])
        redirect(action: "show", id: programInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete() {
        def programInstance = Program.get(params.id)
        if (!programInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "list")
            return
        }

        try {
            programInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'program.label', default: 'Program'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
