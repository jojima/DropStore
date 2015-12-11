package br.dropbox

class Filme extends Produto {
    static hasMany = [criticas: Critica]
    static belongsTo = [genero: GeneroFilme, diretor: Diretor, estudio: Estudio]
    static constraints = {
    }
    
    int duracaoFilme
}
