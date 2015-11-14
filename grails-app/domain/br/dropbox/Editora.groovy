package br.dropbox

class Editora {
    static hasMany = Ebook
    static constraints = {
        nome(blank:false)
    }
    String nome
}
