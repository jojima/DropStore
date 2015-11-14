package br.dropbox

class Critica {

    static constraints = {
        classificacao(min: 0.0f, max: 10.0f)
        comentario(size: 5..100)
    }
    
    float classificacao
    String comentario
    Usuario autor
}
