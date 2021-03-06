<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <asset:stylesheet src="main2.css"/>
        <title>Bem vindo a DropStore</title>
        
    </head>

<body class="homepage">

    
    <div id="page-wrapper">


        <div id="header-wrapper" class="wrapper">
            <div id="header">
                <sec:ifNotLoggedIn>
                <input type="submit" value="Iniciar Sessão" onclick="location. href= 'http://localhost:8080/DropboxImplementacao/login/auth' "> 
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                <input type="submit" value="Encerrar Sessão" onclick="location. href= 'http://localhost:8080/DropboxImplementacao/logout' ">
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                <input type="submit" value="Registrar" onclick="location. href= 'http://localhost:8080/DropboxImplementacao/usuario/create' ">
                </sec:ifNotLoggedIn>
                <div id="logo">
                

<!--                    <div id="grailsLogo" role="banner"><a href="##"><asset:image src="dropbox01.png" alt="Grails"/></a></div>-->
                        
                </div>
                <h1>Produtos da DropStore</h1>
                

                <nav id="nav">
                    <ul>
            
                        <li><a href="http://localhost:8080/DropboxImplementacao/arquivo/index"><h1 style="color:black">Arquivo</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/album/index"><h1 style="color:black">Album</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/artista/index"><h1 style="color:black">Artista</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/autor/index"><h1 style="color:black">Autor</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/carrinhoCompras/index"><h1 style="color:black">Carrinho de Compras</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/critica/index"><h1 style="color:black">Critica</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/diretor/index"><h1 style="color:black">Diretor</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/distribuidora/index"><h1 style="color:black">Distribuidora</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/ebook/index"><h1 style="color:black">eBook</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/editora/index"><h1 style="color:black">Editora</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/estudio/index"><h1 style="color:black">Estudio</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/filme/index"><h1 style="color:black">Filme</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/generoEbook/index"><h1 style="color:black">Genero de eBook</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/generoFilme/index"><h1 style="color:black">Genero de Filme</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/generoMusica/index"><h1 style="color:black">Genero de Musica</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/item/index"><h1 style="color:black">Item</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/pedido/index"><h1 style="color:black">Pedido</a></li>
                        <li><a href="http://localhost:8080/DropboxImplementacao/musica/index"><h1 style="color:black">Musica</a></li>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li><a href="http://localhost:8080/DropboxImplementacao/usuario/index"><h1 style="color:black">Usuarios</a></li>
                        </sec:ifAnyGranted>       
                    
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>