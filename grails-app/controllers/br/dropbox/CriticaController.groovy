package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CriticaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Critica.list(params), model:[criticaInstanceCount: Critica.count()]
    }

    def show(Critica criticaInstance) {
        respond criticaInstance
    }

    def create() {
        respond new Critica(params)
    }

    @Transactional
    def save(Critica criticaInstance) {
        if (criticaInstance == null) {
            notFound()
            return
        }

        if (criticaInstance.hasErrors()) {
            respond criticaInstance.errors, view:'create'
            return
        }

        criticaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'critica.label', default: 'Critica'), criticaInstance.id])
                redirect criticaInstance
            }
            '*' { respond criticaInstance, [status: CREATED] }
        }
    }

    def edit(Critica criticaInstance) {
        respond criticaInstance
    }

    @Transactional
    def update(Critica criticaInstance) {
        if (criticaInstance == null) {
            notFound()
            return
        }

        if (criticaInstance.hasErrors()) {
            respond criticaInstance.errors, view:'edit'
            return
        }

        criticaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Critica.label', default: 'Critica'), criticaInstance.id])
                redirect criticaInstance
            }
            '*'{ respond criticaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Critica criticaInstance) {

        if (criticaInstance == null) {
            notFound()
            return
        }

        criticaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Critica.label', default: 'Critica'), criticaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'critica.label', default: 'Critica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
