package br.dropbox

class Pedido {

    static constraints = {
        dataPedido(blank:true)
        opcao (inList:["Dinheiro", "Cartão de Crédito"])
    }
    
    Date dataPedido
    boolean pedidoAtivo
    boolean pagamentoEfetuado
    String opcao
}
