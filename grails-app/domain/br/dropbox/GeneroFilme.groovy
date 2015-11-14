package br.dropbox

class GeneroFilme {
    static hasMany = [filmes: Filme]
    static constraints = {
        nome(blank:false)
    }
    String nome
}
