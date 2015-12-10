package br.dropbox

class Ebook extends Produto {
    static belongsTo = [genero:GeneroEbook, editora: Editora, autor: Autor]
    static constraints = {
        numPaginas(blank: false)
    }
    
    int numPaginas
}
