package br.dropbox

class Musica {
    static belongsTo = [generom:GeneroMusica, distribuidoras:Distribuidora, albuns:Album]
    static constraints = {
    }
    
    int duracaoMusica
}
