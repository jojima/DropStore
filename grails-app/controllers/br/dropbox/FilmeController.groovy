package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FilmeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

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
    def save() {
       def filmeInstance = new Filme(params)
        
        def filmeFile = request.getFile('imagem')
        
        if(!filmeFile.empty)
            filmeInstance.nomeImg = filmeFile.originalFilename
        
        if (!filmeInstance.save(flush: true)) {
            render(view: "create", model: [filmeInstance: filmeInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def filmeDir = new File(webRootDir, "/Filme/${filmeInstance.id}")
        filmeDir.mkdirs()
        
        if(!filmeFile.empty){
            filmeFile.transferTo( new File( filmeDir, filmeFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Filme.label', default: 'Filme'), filmeInstance.id])
        redirect(action: "show", id: filmeInstance.id)
        
    }

    def edit(long id) {
        def filmeInstance = Filme.get(id)
        
        if (!filmeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Filme.label', default: 'Filme'), id])
            redirect(action: "list")
            return
        }

        [filmeInstance: filmeInstance]
    }

    @Transactional
    def update(long id, long version) {
        
       def filmeInstance = Filme.get(id)
        
        if (!filmeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Filme.label', default: 'Filme'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (filmeInstance.version > version) {
                filmeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'Filme.label', default: 'Filme')] as Object[],
                          "Another user has updated this Filme while you were editing")
                render(view: "edit", model: [filmeInstance: filmeInstance])
                return
            }
        }
                
        def filmeFile = request.getFile('imagem')
        
        if(!filmeFile.empty)
            filmeInstance.nomeImg = filmeFile.originalFilename
        
        if (!filmeInstance.save(flush: true)) {
            render(view: "create", model: [filmeInstance: filmeInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def filmeDir = new File(webRootDir, "/Filme/${filmeInstance.id}")
        filmeDir.mkdirs()
        
        if(!filmeFile.empty){
            filmeFile.transferTo( new File( filmeDir, filmeFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Filme.label', default: 'Filme'), filmeInstance.id])
        redirect(action: "show", id: filmeInstance.id)
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
