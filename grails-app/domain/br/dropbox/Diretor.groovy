package br.dropbox

class Diretor {
    static hasMany = Filme
    static constraints = {
        nome(blank:false)
    }
    String nome
}
