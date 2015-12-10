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
            
        new GeneroFilme(nome: "Romance").addToFilmes(new Filme(titulo: "Titanic" , id: '1', descricao: "História de amor",
            valorUnitario: '10', nota: '10', ano: '2000', nomeImg: "titanic.jpg", duracao: '145')).save();
       
        new GeneroFilme(nome: "Aventura").addToFilmes(new Filme(titulo: "Harry Potter" , id: '2', descricao: "História de Aventura e Fantasia",
            valorUnitario: '25', nota: '8', ano: '2004', nomeImg: "harryPotter.jpg", duracao: '190')).save();
        
        new GeneroFilme(nome: "Animação").addToFilmes(new Filme(titulo: "Frozen" , id: '3', descricao: "História no Gelo",
            valorUnitario: '30', nota: '9', ano: '2015', nomeImg: "frozen.jpg", duracao: '168')).save();
        
        new GeneroFilme(nome: "Ação").addToFilmes(new Filme(titulo: "Duro de Matar" , id: '4', descricao: "História de ação",
            valorUnitario: '18', nota: '6', ano: '2012', nomeImg: "ddm.jpg", duracao: '157')).save();
    }
    
    def destroy = 
    {
    }
}
