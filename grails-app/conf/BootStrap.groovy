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
        }
    
    def destroy = 
    {
    }
}
