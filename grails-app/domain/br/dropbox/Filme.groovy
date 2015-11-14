package br.dropbox

class Filme {
    static belongsTo = [genero: GeneroFilme]
    static constraints = {
    }
    
    int duracaoFilme
}
