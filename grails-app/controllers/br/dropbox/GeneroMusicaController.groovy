package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GeneroMusicaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GeneroMusica.list(params), model:[generoMusicaInstanceCount: GeneroMusica.count()]
    }

    def show(GeneroMusica generoMusicaInstance) {
        respond generoMusicaInstance
    }

    def create() {
        respond new GeneroMusica(params)
    }

    @Transactional
    def save(GeneroMusica generoMusicaInstance) {
        if (generoMusicaInstance == null) {
            notFound()
            return
        }

        if (generoMusicaInstance.hasErrors()) {
            respond generoMusicaInstance.errors, view:'create'
            return
        }

        generoMusicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'generoMusica.label', default: 'GeneroMusica'), generoMusicaInstance.id])
                redirect generoMusicaInstance
            }
            '*' { respond generoMusicaInstance, [status: CREATED] }
        }
    }

    def edit(GeneroMusica generoMusicaInstance) {
        respond generoMusicaInstance
    }

    @Transactional
    def update(GeneroMusica generoMusicaInstance) {
        if (generoMusicaInstance == null) {
            notFound()
            return
        }

        if (generoMusicaInstance.hasErrors()) {
            respond generoMusicaInstance.errors, view:'edit'
            return
        }

        generoMusicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GeneroMusica.label', default: 'GeneroMusica'), generoMusicaInstance.id])
                redirect generoMusicaInstance
            }
            '*'{ respond generoMusicaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GeneroMusica generoMusicaInstance) {

        if (generoMusicaInstance == null) {
            notFound()
            return
        }

        generoMusicaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GeneroMusica.label', default: 'GeneroMusica'), generoMusicaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'generoMusica.label', default: 'GeneroMusica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
