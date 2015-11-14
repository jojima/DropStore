package br.dropbox

class Estudio {
    static hasMany = Filme
    static constraints = {
        nome(blank:false)
    }
    String nome
}
