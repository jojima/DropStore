package br.dropbox

class Musica extends Produto {
    static belongsTo = [generom:GeneroMusica, distribuidoras:Distribuidora, albuns:Album]
    static constraints = {
    }
    
    int duracaoMusica
}
