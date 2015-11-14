package br.dropbox

class Distribuidora {
    static hasMany = [musicas:Musica]
    static constraints = {
        nome(blank:false)
    }
    String nome
}
