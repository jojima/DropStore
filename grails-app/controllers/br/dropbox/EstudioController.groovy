package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstudioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estudio.list(params), model:[estudioInstanceCount: Estudio.count()]
    }

    def show(Estudio estudioInstance) {
        respond estudioInstance
    }

    def create() {
        respond new Estudio(params)
    }

    @Transactional
    def save(Estudio estudioInstance) {
        if (estudioInstance == null) {
            notFound()
            return
        }

        if (estudioInstance.hasErrors()) {
            respond estudioInstance.errors, view:'create'
            return
        }

        estudioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estudio.label', default: 'Estudio'), estudioInstance.id])
                redirect estudioInstance
            }
            '*' { respond estudioInstance, [status: CREATED] }
        }
    }

    def edit(Estudio estudioInstance) {
        respond estudioInstance
    }

    @Transactional
    def update(Estudio estudioInstance) {
        if (estudioInstance == null) {
            notFound()
            return
        }

        if (estudioInstance.hasErrors()) {
            respond estudioInstance.errors, view:'edit'
            return
        }

        estudioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estudio.label', default: 'Estudio'), estudioInstance.id])
                redirect estudioInstance
            }
            '*'{ respond estudioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Estudio estudioInstance) {

        if (estudioInstance == null) {
            notFound()
            return
        }

        estudioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estudio.label', default: 'Estudio'), estudioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estudio.label', default: 'Estudio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
