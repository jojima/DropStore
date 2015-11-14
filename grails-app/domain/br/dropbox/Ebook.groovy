package br.dropbox

class Ebook {
    static belongsTo = [generos:GeneroEbook]
    static constraints = {
        numPaginas(blank: false)
    }
    
    int numPaginas
}
