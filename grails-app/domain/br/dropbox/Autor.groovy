package br.dropbox

class Autor {
    static hasMany = Ebook
    static constraints = {
        nome(blank:false)
    }
    String nome
    
    String toString(){
        return nome
    }
}
