package org.openexercise



import org.junit.*
import grails.test.mixin.*

@TestFor(ProgramDayController)
@Mock(ProgramDay)
class ProgramDayControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/programDay/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.programDayInstanceList.size() == 0
        assert model.programDayInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.programDayInstance != null
    }

    void testSave() {
        controller.save()

        assert model.programDayInstance != null
        assert view == '/programDay/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/programDay/show/1'
        assert controller.flash.message != null
        assert ProgramDay.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/programDay/list'


        populateValidParams(params)
        def programDay = new ProgramDay(params)

        assert programDay.save() != null

        params.id = programDay.id

        def model = controller.show()

        assert model.programDayInstance == programDay
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/programDay/list'


        populateValidParams(params)
        def programDay = new ProgramDay(params)

        assert programDay.save() != null

        params.id = programDay.id

        def model = controller.edit()

        assert model.programDayInstance == programDay
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/programDay/list'

        response.reset()


        populateValidParams(params)
        def programDay = new ProgramDay(params)

        assert programDay.save() != null

        // test invalid parameters in update
        params.id = programDay.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/programDay/edit"
        assert model.programDayInstance != null

        programDay.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/programDay/show/$programDay.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        programDay.clearErrors()

        populateValidParams(params)
        params.id = programDay.id
        params.version = -1
        controller.update()

        assert view == "/programDay/edit"
        assert model.programDayInstance != null
        assert model.programDayInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/programDay/list'

        response.reset()

        populateValidParams(params)
        def programDay = new ProgramDay(params)

        assert programDay.save() != null
        assert ProgramDay.count() == 1

        params.id = programDay.id

        controller.delete()

        assert ProgramDay.count() == 0
        assert ProgramDay.get(programDay.id) == null
        assert response.redirectedUrl == '/programDay/list'
    }
}
