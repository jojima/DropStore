package br.dropbox

class Produto {

    static hasMany = Critica
    static mapping =
    {
         tablePerHierarchy false
    }
    static constraints = {
        titulo(blank:false)
        id(blank:false)
        descricao(blank:false)
        valorUnitario(min:0.0f)
        nota(min:0.0f)
        ano(min:1500)
    }
    
    String titulo
    int id
    String descricao
    float valorUnitario
    float nota
    int ano
    String nomeImg
}
