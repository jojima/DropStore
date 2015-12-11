package br.dropbox

class Critica {
    static belongsTo = [produto: Produto]
    static constraints = {
        classificacao(min: 0.0f, max: 10.0f)
        comentario(size: 5..100)
    }
    
    float classificacao //colocar int e note do produto final e soma das notas crit div pelo num de crit
    String comentario
    Usuario autor
    
    String toString(){
        return autor
    }
}
