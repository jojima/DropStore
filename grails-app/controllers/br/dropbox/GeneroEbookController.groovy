package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GeneroEbookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GeneroEbook.list(params), model:[generoEbookInstanceCount: GeneroEbook.count()]
    }

    def show(GeneroEbook generoEbookInstance) {
        respond generoEbookInstance
    }

    def create() {
        respond new GeneroEbook(params)
    }

    @Transactional
    def save(GeneroEbook generoEbookInstance) {
        if (generoEbookInstance == null) {
            notFound()
            return
        }

        if (generoEbookInstance.hasErrors()) {
            respond generoEbookInstance.errors, view:'create'
            return
        }

        generoEbookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'generoEbook.label', default: 'GeneroEbook'), generoEbookInstance.id])
                redirect generoEbookInstance
            }
            '*' { respond generoEbookInstance, [status: CREATED] }
        }
    }

    def edit(GeneroEbook generoEbookInstance) {
        respond generoEbookInstance
    }

    @Transactional
    def update(GeneroEbook generoEbookInstance) {
        if (generoEbookInstance == null) {
            notFound()
            return
        }

        if (generoEbookInstance.hasErrors()) {
            respond generoEbookInstance.errors, view:'edit'
            return
        }

        generoEbookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GeneroEbook.label', default: 'GeneroEbook'), generoEbookInstance.id])
                redirect generoEbookInstance
            }
            '*'{ respond generoEbookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GeneroEbook generoEbookInstance) {

        if (generoEbookInstance == null) {
            notFound()
            return
        }

        generoEbookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GeneroEbook.label', default: 'GeneroEbook'), generoEbookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'generoEbook.label', default: 'GeneroEbook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
