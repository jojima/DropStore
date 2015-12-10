package br.dropbox

class GeneroFilme {
    static hasMany = [filme: Filme]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
