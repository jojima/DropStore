package br.dropbox

class Filme extends Produto {
    static belongsTo = [genero: GeneroFilme]
    static constraints = {
    }
    
    int duracaoFilme
}
