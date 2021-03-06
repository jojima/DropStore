package br.dropbox



import grails.test.mixin.*
import spock.lang.*

@TestFor(MusicaController)
@Mock(Musica)
class MusicaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.musicaInstanceList
            model.musicaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.musicaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def musica = new Musica()
            musica.validate()
            controller.save(musica)

        then:"The create view is rendered again with the correct model"
            model.musicaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            musica = new Musica(params)

            controller.save(musica)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/musica/show/1'
            controller.flash.message != null
            Musica.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def musica = new Musica(params)
            controller.show(musica)

        then:"A model is populated containing the domain instance"
            model.musicaInstance == musica
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def musica = new Musica(params)
            controller.edit(musica)

        then:"A model is populated containing the domain instance"
            model.musicaInstance == musica
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/musica/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def musica = new Musica()
            musica.validate()
            controller.update(musica)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.musicaInstance == musica

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            musica = new Musica(params).save(flush: true)
            controller.update(musica)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/musica/show/$musica.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/musica/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def musica = new Musica(params).save(flush: true)

        then:"It exists"
            Musica.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(musica)

        then:"The instance is deleted"
            Musica.count() == 0
            response.redirectedUrl == '/musica/index'
            flash.message != null
    }
}
