package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EbookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ebook.list(params), model:[ebookInstanceCount: Ebook.count()]
    }

    def show(Ebook ebookInstance) {
        respond ebookInstance
    }

    def create() {
        respond new Ebook(params)
    }

    @Transactional
    def save(Ebook ebookInstance) {
        if (ebookInstance == null) {
            notFound()
            return
        }

        if (ebookInstance.hasErrors()) {
            respond ebookInstance.errors, view:'create'
            return
        }

        ebookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ebook.label', default: 'Ebook'), ebookInstance.id])
                redirect ebookInstance
            }
            '*' { respond ebookInstance, [status: CREATED] }
        }
    }

    def edit(Ebook ebookInstance) {
        respond ebookInstance
    }

    @Transactional
    def update(Ebook ebookInstance) {
        if (ebookInstance == null) {
            notFound()
            return
        }

        if (ebookInstance.hasErrors()) {
            respond ebookInstance.errors, view:'edit'
            return
        }

        ebookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ebook.label', default: 'Ebook'), ebookInstance.id])
                redirect ebookInstance
            }
            '*'{ respond ebookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ebook ebookInstance) {

        if (ebookInstance == null) {
            notFound()
            return
        }

        ebookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ebook.label', default: 'Ebook'), ebookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ebook.label', default: 'Ebook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
