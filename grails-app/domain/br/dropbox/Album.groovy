package br.dropbox

class Album {
    static hasMany = [listaMusicas:Musica]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
