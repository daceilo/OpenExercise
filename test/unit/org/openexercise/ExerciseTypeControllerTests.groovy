package org.openexercise



import org.junit.*
import grails.test.mixin.*

@TestFor(ExerciseTypeController)
@Mock(ExerciseType)
class ExerciseTypeControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/exerciseType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.exerciseTypeInstanceList.size() == 0
        assert model.exerciseTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.exerciseTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.exerciseTypeInstance != null
        assert view == '/exerciseType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/exerciseType/show/1'
        assert controller.flash.message != null
        assert ExerciseType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseType/list'


        populateValidParams(params)
        def exerciseType = new ExerciseType(params)

        assert exerciseType.save() != null

        params.id = exerciseType.id

        def model = controller.show()

        assert model.exerciseTypeInstance == exerciseType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseType/list'


        populateValidParams(params)
        def exerciseType = new ExerciseType(params)

        assert exerciseType.save() != null

        params.id = exerciseType.id

        def model = controller.edit()

        assert model.exerciseTypeInstance == exerciseType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseType/list'

        response.reset()


        populateValidParams(params)
        def exerciseType = new ExerciseType(params)

        assert exerciseType.save() != null

        // test invalid parameters in update
        params.id = exerciseType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/exerciseType/edit"
        assert model.exerciseTypeInstance != null

        exerciseType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/exerciseType/show/$exerciseType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        exerciseType.clearErrors()

        populateValidParams(params)
        params.id = exerciseType.id
        params.version = -1
        controller.update()

        assert view == "/exerciseType/edit"
        assert model.exerciseTypeInstance != null
        assert model.exerciseTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/exerciseType/list'

        response.reset()

        populateValidParams(params)
        def exerciseType = new ExerciseType(params)

        assert exerciseType.save() != null
        assert ExerciseType.count() == 1

        params.id = exerciseType.id

        controller.delete()

        assert ExerciseType.count() == 0
        assert ExerciseType.get(exerciseType.id) == null
        assert response.redirectedUrl == '/exerciseType/list'
    }
}
