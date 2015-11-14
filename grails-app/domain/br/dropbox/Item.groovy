package br.dropbox

class Item {

    static hasMany = Produto
    
    static constraints = {
        indice(blank:false)
        quantidade(min:0)
    }
    
    int indice
    int quantidade
}
