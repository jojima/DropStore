package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FilmeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Filme.list(params), model:[filmeInstanceCount: Filme.count()]
    }

    def show(Filme filmeInstance) {
        respond filmeInstance
    }

    def create() {
        respond new Filme(params)
    }

    @Transactional
    def save(Filme filmeInstance) {
        if (filmeInstance == null) {
            notFound()
            return
        }

        if (filmeInstance.hasErrors()) {
            respond filmeInstance.errors, view:'create'
            return
        }

        filmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'filme.label', default: 'Filme'), filmeInstance.id])
                redirect filmeInstance
            }
            '*' { respond filmeInstance, [status: CREATED] }
        }
    }

    def edit(Filme filmeInstance) {
        respond filmeInstance
    }

    @Transactional
    def update(Filme filmeInstance) {
        if (filmeInstance == null) {
            notFound()
            return
        }

        if (filmeInstance.hasErrors()) {
            respond filmeInstance.errors, view:'edit'
            return
        }

        filmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Filme.label', default: 'Filme'), filmeInstance.id])
                redirect filmeInstance
            }
            '*'{ respond filmeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Filme filmeInstance) {

        if (filmeInstance == null) {
            notFound()
            return
        }

        filmeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Filme.label', default: 'Filme'), filmeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'filme.label', default: 'Filme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
