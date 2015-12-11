package br.dropbox

class Ebook extends Produto {
    static hasMany = [criticas: Critica]
    static belongsTo = [genero:GeneroEbook, editora: Editora, autor: Autor]
    static constraints = {
        numPaginas(blank: false)
    }
    
    int numPaginas
}
