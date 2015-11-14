package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArtistaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Artista.list(params), model:[artistaInstanceCount: Artista.count()]
    }

    def show(Artista artistaInstance) {
        respond artistaInstance
    }

    def create() {
        respond new Artista(params)
    }

    @Transactional
    def save(Artista artistaInstance) {
        if (artistaInstance == null) {
            notFound()
            return
        }

        if (artistaInstance.hasErrors()) {
            respond artistaInstance.errors, view:'create'
            return
        }

        artistaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'artista.label', default: 'Artista'), artistaInstance.id])
                redirect artistaInstance
            }
            '*' { respond artistaInstance, [status: CREATED] }
        }
    }

    def edit(Artista artistaInstance) {
        respond artistaInstance
    }

    @Transactional
    def update(Artista artistaInstance) {
        if (artistaInstance == null) {
            notFound()
            return
        }

        if (artistaInstance.hasErrors()) {
            respond artistaInstance.errors, view:'edit'
            return
        }

        artistaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Artista.label', default: 'Artista'), artistaInstance.id])
                redirect artistaInstance
            }
            '*'{ respond artistaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Artista artistaInstance) {

        if (artistaInstance == null) {
            notFound()
            return
        }

        artistaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Artista.label', default: 'Artista'), artistaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'artista.label', default: 'Artista'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
