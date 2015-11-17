package br.dropbox



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MusicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Musica.list(params), model:[musicaInstanceCount: Musica.count()]
    }

    def show(Musica musicaInstance) {
        respond musicaInstance
    }

    def create() {
        respond new Musica(params)
    }

    @Transactional
    def save() {
        def musicaInstance = new Musica(params)
        
        def musicaFile = request.getFile('imagem')
        
        if(!musicaFile.empty)
            musicaInstance.nomeImg = musicaFile.originalFilename
        
        if (!musicaInstance.save(flush: true)) {
            render(view: "create", model: [musicaInstance: musicaInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def musicaDir = new File(webRootDir, "/Musica/${musicaInstance.id}")
        musicaDir.mkdirs()
        
        if(!musicaFile.empty){
            musicaFile.transferTo( new File( musicaDir, musicaFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Musica.label', default: 'Musica'), musicaInstance.id])
        redirect(action: "show", id: musicaInstance.id)
    }

    def edit(long id) {
        
        def musicaInstance = Musica.get(id)
        
        if (!musicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Musica.label', default: 'Musica'), id])
            redirect(action: "list")
            return
        }

        [musicaInstance: musicaInstance]
    }

    @Transactional
    def update(long id, long version) {
        
        def musicaInstance = Musica.get(id)
        
        if (!musicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'Musica.label', default: 'Musica'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (musicaInstance.version > version) {
                musicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'Musica.label', default: 'Musica')] as Object[],
                          "Another user has updated this Musica while you were editing")
                render(view: "edit", model: [musicaInstance: musicaInstance])
                return
            }
        }
                
        def musicaFile = request.getFile('imagem')
        
        if(!musicaFile.empty)
            musicaInstance.nomeImg = musicaFile.originalFilename
        
        if (!musicaInstance.save(flush: true)) {
            render(view: "create", model: [musicaInstance: musicaInstance])
            return
        }
        
        def webRootDir = servletContext.getRealPath("/")
        def musicaDir = new File(webRootDir, "/Musica/${musicaInstance.id}")
        filmeDir.mkdirs()
        
        if(!musicaFile.empty){
            musicaFile.transferTo( new File( musicaDir, musicaFile.originalFilename))
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'Musica.label', default: 'Musica'), musicaInstance.id])
        redirect(action: "show", id: musicaInstance.id)
    }

    @Transactional
    def delete(Musica musicaInstance) {

        if (musicaInstance == null) {
            notFound()
            return
        }

        musicaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Musica.label', default: 'Musica'), musicaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'musica.label', default: 'Musica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
