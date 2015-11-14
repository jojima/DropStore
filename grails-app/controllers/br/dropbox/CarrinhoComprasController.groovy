package br.dropbox

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarrinhoComprasController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarrinhoCompras.list(params), model:[carrinhoComprasInstanceCount: CarrinhoCompras.count()]
    }

    def show(CarrinhoCompras carrinhoComprasInstance) {
        respond carrinhoComprasInstance
    }

    def create() {
        respond new CarrinhoCompras(params)
    }

    @Transactional
    def save(CarrinhoCompras carrinhoComprasInstance) {
        if (carrinhoComprasInstance == null) {
            notFound()
            return
        }

        if (carrinhoComprasInstance.hasErrors()) {
            respond carrinhoComprasInstance.errors, view:'create'
            return
        }

        carrinhoComprasInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carrinhoCompras.label', default: 'CarrinhoCompras'), carrinhoComprasInstance.id])
                redirect carrinhoComprasInstance
            }
            '*' { respond carrinhoComprasInstance, [status: CREATED] }
        }
    }

    def edit(CarrinhoCompras carrinhoComprasInstance) {
        respond carrinhoComprasInstance
    }

    @Transactional
    def update(CarrinhoCompras carrinhoComprasInstance) {
        if (carrinhoComprasInstance == null) {
            notFound()
            return
        }

        if (carrinhoComprasInstance.hasErrors()) {
            respond carrinhoComprasInstance.errors, view:'edit'
            return
        }

        carrinhoComprasInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarrinhoCompras.label', default: 'CarrinhoCompras'), carrinhoComprasInstance.id])
                redirect carrinhoComprasInstance
            }
            '*'{ respond carrinhoComprasInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarrinhoCompras carrinhoComprasInstance) {

        if (carrinhoComprasInstance == null) {
            notFound()
            return
        }

        carrinhoComprasInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarrinhoCompras.label', default: 'CarrinhoCompras'), carrinhoComprasInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrinhoCompras.label', default: 'CarrinhoCompras'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
