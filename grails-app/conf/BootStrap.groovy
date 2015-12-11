import br.dropbox.*

class BootStrap 
{

    def init = { servletContext ->
        
            def adminPapel = Papel.findOrSaveWhere(authority: 'ROLE_ADMIN')
            def user = Usuario.findOrSaveWhere(username: 'admin', password: 'admin', nome:'Administrador')
            
            if(!user.authorities.contains(adminPapel))
            {
                UsuarioPapel.create(user, adminPapel, true)
            }    
            def normalPapel = Papel.findOrSaveWhere(authority: 'ROLE_USER')
            def user2 = Usuario.findOrSaveWhere(username: 'user', password: 'password', nome:'Usuario')
            
            if(!user.authorities.contains(normalPapel))
            {
                UsuarioPapel.create(user2, normalPapel, true)
            }
        GeneroEbook ficcao = new GeneroEbook(nome: "Ficção")
        ficcao.save()
        GeneroEbook aventura = new GeneroEbook(nome: "Aventura")
        aventura.save()
        GeneroEbook tecnico = new GeneroEbook(nome: "Tecnico")
        tecnico.save()
        
        GeneroFilme acao = new GeneroFilme(nome: "Ação")
        acao.save()
        GeneroFilme romance = new GeneroFilme(nome: "Romance")
        romance.save()
        GeneroFilme comedia = new GeneroFilme(nome: "Comédia")
        comedia.save()
        
        GeneroMusica forro = new GeneroMusica(nome: "Forró")
        forro.save()
        GeneroMusica sertanejo = new GeneroMusica(nome: "Sertanejo")
        sertanejo.save()
        GeneroMusica barroca = new GeneroMusica(nome: "Barroca")
        barroca.save()
        
        Album summerHits = new Album(nome: "Summer Hits")
        summerHits.save()
        Album furacao = new Album(nome: "Furacão 2000")
        furacao.save()
        
        Artista adele = new Artista(nome: "Adele")
        adele.save()
        Artista safadao = new Artista(nome: "Wesley Safadão")
        safadao.save()
        
        Autor machado = new Autor(nome: "Machado de Assis")
        machado.save()
        Autor sommerville = new Autor(nome: "Ian Sommerville")
        sommerville.save()
        
        Diretor spielberg = new Diretor(nome: "Steven Spielberg")
        spielberg.save()
        Diretor padilha = new Diretor(nome: "José Padilha")
        padilha.save()
        
        Distribuidora somlivre = new Distribuidora(nome: "Som Livre")
        somlivre.save()
        Distribuidora record = new Distribuidora(nome: "Record Music")
        record.save()

        Editora pearson = new Editora(nome: "Pearson")
        pearson.save()
        Editora abril = new Editora(nome: "Abril")
        abril.save()
        
        Estudio disney = new Estudio(nome: "Disney")
        disney.save()
        Estudio mgm = new Estudio(nome: "MGM")
        mgm.save()
        
        
        new Filme(titulo: "Titanic" , id: '1', descricao: "História de amor",
        valorUnitario: '10', nota: '10', ano: '2000', nomeImg: "titanic.jpg", duracao: '145', genero: romance,
        diretor: spielberg, estudio: mgm).save();
       
        new Filme(titulo: "Frozen" , id: '2', descricao: "História de gelo",
        valorUnitario: '15', nota: '10', ano: '2014', nomeImg: "frozen.jpg", duracao: '119', genero: comedia,
        diretor: padilha, estudio: disney).save();
    
        new Ebook(titulo: "Engenharia de Software 7ed" , id: '3', descricao: "História de softwares",
        valorUnitario: '90', nota: '10', ano: '2011', nomeImg: "sommerville.jpg", numPaginas: '500', genero: tecnico,
        editora: pearson, autor: sommerville).save();
    
        new Ebook(titulo: "Dom Casmurro" , id: '4', descricao: "História para FUVEST",
        valorUnitario: '10', nota: '9', ano: '1899', nomeImg: "domcasmurro.jpg", numPaginas: '200', genero: aventura,
        editora: abril, autor: machado).save();
    
        new Musica(titulo: "Camarote" , id: '5', descricao: "História de uma festa...",
        valorUnitario: '3', nota: '8', ano: '2015', nomeImg: "camarote.jpg", duracaoMusica: '3', genero: forro,
        artista: safadao, distribuidora: somlivre, album: summerHits).save();
    
        new Musica(titulo: "Hello" , id: '6', descricao: "História de Olar!",
        valorUnitario: '3', nota: '9', ano: '2015', nomeImg: "hello.jpg", duracaoMusica: '3', genero: barroca,
        artista: adele, distribuidora: record, album: furacao).save();
    }
    
    def destroy = 
    {
    }
}
