package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EbookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

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
    def save() {
        def ebookInstance = new Ebook(params)
        
        def ebookFile = request.getFile('imagem')
        
        if(!ebookFile.empty)
            ebookInstance.nomeImg = ebookFile.originalFilename
        
        if (!ebookInstance.save(flush: true)) {
            render(view: "create", model: [ebookInstance: ebookInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def ebookDir = new File(webRootDir, "/Ebook/${ebookInstance.id}")
        ebookDir.mkdirs()
        
        if(!ebookFile.empty){
            ebookFile.transferTo( new File( ebookDir, ebookFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Ebook.label', default: 'Ebook'), ebookInstance.id])
        redirect(action: "show", id: ebookInstance.id)
    }

    def edit(long id) {
        
        def ebookInstance = Ebook.get(id)
        
        if (!ebookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Ebook.label', default: 'Ebook'), id])
            redirect(action: "list")
            return
        }

        [ebookInstance: ebookInstance]
    }

    @Transactional
    def update(long id, long version) {
        def ebookInstance = Ebook.get(id)
        
        if (!ebookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Ebook.label', default: 'Ebook'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ebookInstance.version > version) {
                ebookInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'Ebook.label', default: 'Ebook')] as Object[],
                          "Another user has updated this Ebook while you were editing")
                render(view: "edit", model: [ebookInstance: ebookInstance])
                return
            }
        }
                
        def ebookFile = request.getFile('imagem')
        
        if(!ebookFile.empty)
            ebookInstance.nomeImg = ebookFile.originalFilename
        
        if (!ebookInstance.save(flush: true)) {
            render(view: "create", model: [ebookInstance: ebookInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def ebookDir = new File(webRootDir, "/Ebook/${ebookInstance.id}")
        ebookDir.mkdirs()
        
        if(!ebookFile.empty){
            ebookFile.transferTo( new File( ebookDir, ebookFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Ebook.label', default: 'Ebook'), ebookInstance.id])
        redirect(action: "show", id: ebookInstance.id)
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
