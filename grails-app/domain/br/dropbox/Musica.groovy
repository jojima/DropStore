package br.dropbox

class Musica extends Produto {
    static hasMany = [criticas: Critica]
    static belongsTo = [genero:GeneroMusica, artista: Artista, distribuidora:Distribuidora, album:Album]
    static constraints = {
    }
    
    int duracaoMusica
}
