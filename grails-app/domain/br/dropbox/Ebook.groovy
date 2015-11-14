package br.dropbox

class Ebook extends Produto {
    static belongsTo = [generos:GeneroEbook]
    static constraints = {
        numPaginas(blank: false)
    }
    
    int numPaginas
}
