package br.dropbox

class Arquivo {

    static constraints = {
        titulo(blank:false)
        tipo(blank:false)
    }
    
    String titulo
    String tipo
    int tamanho
    int dataCriacao
    
}
