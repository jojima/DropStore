package br.dropbox

class GeneroEbook {
    static hasMany = [livros:Ebook]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
