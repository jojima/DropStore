package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EditoraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Editora.list(params), model:[editoraInstanceCount: Editora.count()]
    }

    def show(Editora editoraInstance) {
        respond editoraInstance
    }

    def create() {
        respond new Editora(params)
    }

    @Transactional
    def save(Editora editoraInstance) {
        if (editoraInstance == null) {
            notFound()
            return
        }

        if (editoraInstance.hasErrors()) {
            respond editoraInstance.errors, view:'create'
            return
        }

        editoraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'editora.label', default: 'Editora'), editoraInstance.id])
                redirect editoraInstance
            }
            '*' { respond editoraInstance, [status: CREATED] }
        }
    }

    def edit(Editora editoraInstance) {
        respond editoraInstance
    }

    @Transactional
    def update(Editora editoraInstance) {
        if (editoraInstance == null) {
            notFound()
            return
        }

        if (editoraInstance.hasErrors()) {
            respond editoraInstance.errors, view:'edit'
            return
        }

        editoraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Editora.label', default: 'Editora'), editoraInstance.id])
                redirect editoraInstance
            }
            '*'{ respond editoraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Editora editoraInstance) {

        if (editoraInstance == null) {
            notFound()
            return
        }

        editoraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Editora.label', default: 'Editora'), editoraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'editora.label', default: 'Editora'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
