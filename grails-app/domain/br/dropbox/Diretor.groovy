package br.dropbox

class Diretor {
    static hasMany = [filme:Filme]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
