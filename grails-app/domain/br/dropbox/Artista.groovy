package br.dropbox

class Artista {
    static hasMany = Musica
    static constraints = {
        nome(blank:false)
    }
    String nome
}
