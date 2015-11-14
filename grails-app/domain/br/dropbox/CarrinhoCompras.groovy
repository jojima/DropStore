package br.dropbox

class CarrinhoCompras{

    static hasMany = Item
    static hasOne = Produto
    
    static constraints = {
        valorTotal(min: 0.0f)
        dataDeFinalizacao(blank: false)
    }
    
    float valorTotal
    Date dataDeFinalizacao
}
