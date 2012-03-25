package org.openexercise



import org.junit.*
import grails.test.mixin.*

@TestFor(BlogEntryController)
@Mock(BlogEntry)
class BlogEntryControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/blogEntry/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.blogEntryInstanceList.size() == 0
        assert model.blogEntryInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.blogEntryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.blogEntryInstance != null
        assert view == '/blogEntry/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/blogEntry/show/1'
        assert controller.flash.message != null
        assert BlogEntry.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/blogEntry/list'


        populateValidParams(params)
        def blogEntry = new BlogEntry(params)

        assert blogEntry.save() != null

        params.id = blogEntry.id

        def model = controller.show()

        assert model.blogEntryInstance == blogEntry
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/blogEntry/list'


        populateValidParams(params)
        def blogEntry = new BlogEntry(params)

        assert blogEntry.save() != null

        params.id = blogEntry.id

        def model = controller.edit()

        assert model.blogEntryInstance == blogEntry
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/blogEntry/list'

        response.reset()


        populateValidParams(params)
        def blogEntry = new BlogEntry(params)

        assert blogEntry.save() != null

        // test invalid parameters in update
        params.id = blogEntry.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/blogEntry/edit"
        assert model.blogEntryInstance != null

        blogEntry.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/blogEntry/show/$blogEntry.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        blogEntry.clearErrors()

        populateValidParams(params)
        params.id = blogEntry.id
        params.version = -1
        controller.update()

        assert view == "/blogEntry/edit"
        assert model.blogEntryInstance != null
        assert model.blogEntryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/blogEntry/list'

        response.reset()

        populateValidParams(params)
        def blogEntry = new BlogEntry(params)

        assert blogEntry.save() != null
        assert BlogEntry.count() == 1

        params.id = blogEntry.id

        controller.delete()

        assert BlogEntry.count() == 0
        assert BlogEntry.get(blogEntry.id) == null
        assert response.redirectedUrl == '/blogEntry/list'
    }
}
