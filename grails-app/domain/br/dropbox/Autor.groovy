package br.dropbox

class Autor {
    static hasMany = [livro:Ebook]
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
