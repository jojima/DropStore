package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProdutoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Produto.list(params), model:[produtoInstanceCount: Produto.count()]
    }

    def show(Produto produtoInstance) {
        respond produtoInstance
    }

    def create() {
        respond new Produto(params)
    }

    @Transactional
    def save() {
        
        def produtoInstance = new Produto(params)
        
        def produtoFile = request.getFile('imagem')
        
        if(!produtoFile.empty)
            produtoInstance.nomeImg = produtoFile.originalFilename
        
        if (!produtoInstance.save(flush: true)) {
            render(view: "create", model: [produtoInstance: produtoInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def produtoDir = new File(webRootDir, "/Produto/${produtoInstance.id}")
        produtoDir.mkdirs()
        
        if(!produtoFile.empty){
            produtoFile.transferTo( new File( produtoDir, produtoFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
        redirect(action: "show", id: produtoInstance.id)
        
    }

    def edit(long id) {
        
        def produtoInstance = Produto.get(id)
        
        if (!produtoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Produto.label', default: 'Produto'), id])
            redirect(action: "list")
            return
        }

        [produtoInstance: produtoInstance]
    }

    @Transactional
    def update(Long id,Long version) {
      
        def produtoInstance = Produto.get(id)
        
        if (!produtoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Produto.label', default: 'Produto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (produtoInstance.version > version) {
                produtoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'Produto.label', default: 'Produto')] as Object[],
                          "Another user has updated this Produto while you were editing")
                render(view: "edit", model: [produtoInstance: produtoInstance])
                return
            }
        }
                
        def produtoFile = request.getFile('imagem')
        
        if(!produtoFile.empty)
            produtoInstance.nomeImg = produtoFile.originalFilename
        
        if (!produtoInstance.save(flush: true)) {
            render(view: "create", model: [produtoInstance: produtoInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def produtoDir = new File(webRootDir, "/Produto/${produtoInstance.id}")
        produtoDir.mkdirs()
        
        if(!produtoFile.empty){
            produtoFile.transferTo( new File( produtoDir, produtoFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
        redirect(action: "show", id: produtoInstance.id)
        
    }

    @Transactional
    def delete(Produto produtoInstance) {

        if (produtoInstance == null) {
            notFound()
            return
        }

        produtoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Produto.label', default: 'Produto'), produtoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Produto.label', default: 'Produto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}