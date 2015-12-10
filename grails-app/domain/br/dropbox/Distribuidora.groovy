package br.dropbox

class Distribuidora {
    static hasMany = [musica:Musica]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
