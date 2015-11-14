package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GeneroFilmeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GeneroFilme.list(params), model:[generoFilmeInstanceCount: GeneroFilme.count()]
    }

    def show(GeneroFilme generoFilmeInstance) {
        respond generoFilmeInstance
    }

    def create() {
        respond new GeneroFilme(params)
    }

    @Transactional
    def save(GeneroFilme generoFilmeInstance) {
        if (generoFilmeInstance == null) {
            notFound()
            return
        }

        if (generoFilmeInstance.hasErrors()) {
            respond generoFilmeInstance.errors, view:'create'
            return
        }

        generoFilmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'generoFilme.label', default: 'GeneroFilme'), generoFilmeInstance.id])
                redirect generoFilmeInstance
            }
            '*' { respond generoFilmeInstance, [status: CREATED] }
        }
    }

    def edit(GeneroFilme generoFilmeInstance) {
        respond generoFilmeInstance
    }

    @Transactional
    def update(GeneroFilme generoFilmeInstance) {
        if (generoFilmeInstance == null) {
            notFound()
            return
        }

        if (generoFilmeInstance.hasErrors()) {
            respond generoFilmeInstance.errors, view:'edit'
            return
        }

        generoFilmeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'GeneroFilme.label', default: 'GeneroFilme'), generoFilmeInstance.id])
                redirect generoFilmeInstance
            }
            '*'{ respond generoFilmeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(GeneroFilme generoFilmeInstance) {

        if (generoFilmeInstance == null) {
            notFound()
            return
        }

        generoFilmeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'GeneroFilme.label', default: 'GeneroFilme'), generoFilmeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'generoFilme.label', default: 'GeneroFilme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
