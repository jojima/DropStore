package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiretorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Diretor.list(params), model:[diretorInstanceCount: Diretor.count()]
    }

    def show(Diretor diretorInstance) {
        respond diretorInstance
    }

    def create() {
        respond new Diretor(params)
    }

    @Transactional
    def save(Diretor diretorInstance) {
        if (diretorInstance == null) {
            notFound()
            return
        }

        if (diretorInstance.hasErrors()) {
            respond diretorInstance.errors, view:'create'
            return
        }

        diretorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diretor.label', default: 'Diretor'), diretorInstance.id])
                redirect diretorInstance
            }
            '*' { respond diretorInstance, [status: CREATED] }
        }
    }

    def edit(Diretor diretorInstance) {
        respond diretorInstance
    }

    @Transactional
    def update(Diretor diretorInstance) {
        if (diretorInstance == null) {
            notFound()
            return
        }

        if (diretorInstance.hasErrors()) {
            respond diretorInstance.errors, view:'edit'
            return
        }

        diretorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Diretor.label', default: 'Diretor'), diretorInstance.id])
                redirect diretorInstance
            }
            '*'{ respond diretorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Diretor diretorInstance) {

        if (diretorInstance == null) {
            notFound()
            return
        }

        diretorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Diretor.label', default: 'Diretor'), diretorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diretor.label', default: 'Diretor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
