package br.dropbox

class Editora {
    static hasMany = [livro:Ebook]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
