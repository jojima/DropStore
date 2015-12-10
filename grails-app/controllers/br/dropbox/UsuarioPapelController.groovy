package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioPapelController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsuarioPapel.list(params), model:[usuarioPapelInstanceCount: UsuarioPapel.count()]
    }

    def show(UsuarioPapel usuarioPapelInstance) {
        respond usuarioPapelInstance
    }

    def create() {
        respond new UsuarioPapel(params)
    }

    @Transactional
    def save(UsuarioPapel usuarioPapelInstance) {
        if (usuarioPapelInstance == null) {
            notFound()
            return
        }

        if (usuarioPapelInstance.hasErrors()) {
            respond usuarioPapelInstance.errors, view:'create'
            return
        }

        usuarioPapelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioPapel.label', default: 'UsuarioPapel'), usuarioPapelInstance.id])
                redirect usuarioPapelInstance
            }
            '*' { respond usuarioPapelInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioPapel usuarioPapelInstance) {
        respond usuarioPapelInstance
    }

    @Transactional
    def update(UsuarioPapel usuarioPapelInstance) {
        if (usuarioPapelInstance == null) {
            notFound()
            return
        }

        if (usuarioPapelInstance.hasErrors()) {
            respond usuarioPapelInstance.errors, view:'edit'
            return
        }

        usuarioPapelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsuarioPapel.label', default: 'UsuarioPapel'), usuarioPapelInstance.id])
                redirect usuarioPapelInstance
            }
            '*'{ respond usuarioPapelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsuarioPapel usuarioPapelInstance) {

        if (usuarioPapelInstance == null) {
            notFound()
            return
        }

        usuarioPapelInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsuarioPapel.label', default: 'UsuarioPapel'), usuarioPapelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioPapel.label', default: 'UsuarioPapel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
