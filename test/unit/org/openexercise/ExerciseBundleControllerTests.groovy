package org.openexercise



import org.junit.*
import grails.test.mixin.*

@TestFor(ExerciseBundleController)
@Mock(ExerciseBundle)
class ExerciseBundleControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/exerciseBundle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.exerciseBundleInstanceList.size() == 0
        assert model.exerciseBundleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.exerciseBundleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.exerciseBundleInstance != null
        assert view == '/exerciseBundle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/exerciseBundle/show/1'
        assert controller.flash.message != null
        assert ExerciseBundle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseBundle/list'


        populateValidParams(params)
        def exerciseBundle = new ExerciseBundle(params)

        assert exerciseBundle.save() != null

        params.id = exerciseBundle.id

        def model = controller.show()

        assert model.exerciseBundleInstance == exerciseBundle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseBundle/list'


        populateValidParams(params)
        def exerciseBundle = new ExerciseBundle(params)

        assert exerciseBundle.save() != null

        params.id = exerciseBundle.id

        def model = controller.edit()

        assert model.exerciseBundleInstance == exerciseBundle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/exerciseBundle/list'

        response.reset()


        populateValidParams(params)
        def exerciseBundle = new ExerciseBundle(params)

        assert exerciseBundle.save() != null

        // test invalid parameters in update
        params.id = exerciseBundle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/exerciseBundle/edit"
        assert model.exerciseBundleInstance != null

        exerciseBundle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/exerciseBundle/show/$exerciseBundle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        exerciseBundle.clearErrors()

        populateValidParams(params)
        params.id = exerciseBundle.id
        params.version = -1
        controller.update()

        assert view == "/exerciseBundle/edit"
        assert model.exerciseBundleInstance != null
        assert model.exerciseBundleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/exerciseBundle/list'

        response.reset()

        populateValidParams(params)
        def exerciseBundle = new ExerciseBundle(params)

        assert exerciseBundle.save() != null
        assert ExerciseBundle.count() == 1

        params.id = exerciseBundle.id

        controller.delete()

        assert ExerciseBundle.count() == 0
        assert ExerciseBundle.get(exerciseBundle.id) == null
        assert response.redirectedUrl == '/exerciseBundle/list'
    }
}
