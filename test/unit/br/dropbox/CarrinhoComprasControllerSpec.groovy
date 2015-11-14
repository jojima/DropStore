package br.dropbox



import grails.test.mixin.*
import spock.lang.*

@TestFor(CarrinhoComprasController)
@Mock(CarrinhoCompras)
class CarrinhoComprasControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.carrinhoComprasInstanceList
            model.carrinhoComprasInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.carrinhoComprasInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def carrinhoCompras = new CarrinhoCompras()
            carrinhoCompras.validate()
            controller.save(carrinhoCompras)

        then:"The create view is rendered again with the correct model"
            model.carrinhoComprasInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            carrinhoCompras = new CarrinhoCompras(params)

            controller.save(carrinhoCompras)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/carrinhoCompras/show/1'
            controller.flash.message != null
            CarrinhoCompras.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def carrinhoCompras = new CarrinhoCompras(params)
            controller.show(carrinhoCompras)

        then:"A model is populated containing the domain instance"
            model.carrinhoComprasInstance == carrinhoCompras
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def carrinhoCompras = new CarrinhoCompras(params)
            controller.edit(carrinhoCompras)

        then:"A model is populated containing the domain instance"
            model.carrinhoComprasInstance == carrinhoCompras
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/carrinhoCompras/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def carrinhoCompras = new CarrinhoCompras()
            carrinhoCompras.validate()
            controller.update(carrinhoCompras)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.carrinhoComprasInstance == carrinhoCompras

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            carrinhoCompras = new CarrinhoCompras(params).save(flush: true)
            controller.update(carrinhoCompras)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/carrinhoCompras/show/$carrinhoCompras.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/carrinhoCompras/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def carrinhoCompras = new CarrinhoCompras(params).save(flush: true)

        then:"It exists"
            CarrinhoCompras.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(carrinhoCompras)

        then:"The instance is deleted"
            CarrinhoCompras.count() == 0
            response.redirectedUrl == '/carrinhoCompras/index'
            flash.message != null
    }
}
