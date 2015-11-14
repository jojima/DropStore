package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DistribuidoraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Distribuidora.list(params), model:[distribuidoraInstanceCount: Distribuidora.count()]
    }

    def show(Distribuidora distribuidoraInstance) {
        respond distribuidoraInstance
    }

    def create() {
        respond new Distribuidora(params)
    }

    @Transactional
    def save(Distribuidora distribuidoraInstance) {
        if (distribuidoraInstance == null) {
            notFound()
            return
        }

        if (distribuidoraInstance.hasErrors()) {
            respond distribuidoraInstance.errors, view:'create'
            return
        }

        distribuidoraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'distribuidora.label', default: 'Distribuidora'), distribuidoraInstance.id])
                redirect distribuidoraInstance
            }
            '*' { respond distribuidoraInstance, [status: CREATED] }
        }
    }

    def edit(Distribuidora distribuidoraInstance) {
        respond distribuidoraInstance
    }

    @Transactional
    def update(Distribuidora distribuidoraInstance) {
        if (distribuidoraInstance == null) {
            notFound()
            return
        }

        if (distribuidoraInstance.hasErrors()) {
            respond distribuidoraInstance.errors, view:'edit'
            return
        }

        distribuidoraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Distribuidora.label', default: 'Distribuidora'), distribuidoraInstance.id])
                redirect distribuidoraInstance
            }
            '*'{ respond distribuidoraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Distribuidora distribuidoraInstance) {

        if (distribuidoraInstance == null) {
            notFound()
            return
        }

        distribuidoraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Distribuidora.label', default: 'Distribuidora'), distribuidoraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'distribuidora.label', default: 'Distribuidora'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
