package br.dropbox

class Filme extends Produto {
    static belongsTo = [genero: GeneroFilme, diretor: Diretor, estudio: Estudio]
    static constraints = {
    }
    
    int duracaoFilme
}
