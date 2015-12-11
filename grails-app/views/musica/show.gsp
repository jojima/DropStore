
<%@ page import="br.dropbox.Musica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'musica.label', default: 'Musica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-musica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-musica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list musica">
			
				<g:if test="${musicaInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="musica.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${musicaInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="musica.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${musicaInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.valorUnitario}">
				<li class="fieldcontain">
					<span id="valorUnitario-label" class="property-label"><g:message code="musica.valorUnitario.label" default="Valor Unitario" /></span>
					
						<span class="property-value" aria-labelledby="valorUnitario-label"><g:fieldValue bean="${musicaInstance}" field="valorUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="musica.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${musicaInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="musica.ano.label" default="Ano" /></span>
					
						<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${musicaInstance}" field="ano"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.album}">
				<li class="fieldcontain">
					<span id="album-label" class="property-label"><g:message code="musica.album.label" default="Album" /></span>
					
						<span class="property-value" aria-labelledby="album-label"><g:link controller="album" action="show" id="${musicaInstance?.album?.id}">${musicaInstance?.album?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.artista}">
				<li class="fieldcontain">
					<span id="artista-label" class="property-label"><g:message code="musica.artista.label" default="Artista" /></span>
					
						<span class="property-value" aria-labelledby="artista-label"><g:link controller="artista" action="show" id="${musicaInstance?.artista?.id}">${musicaInstance?.artista?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.criticas}">
				<li class="fieldcontain">
					<span id="criticas-label" class="property-label"><g:message code="musica.criticas.label" default="Criticas" /></span>
					
						<g:each in="${musicaInstance.criticas}" var="c">
						<span class="property-value" aria-labelledby="criticas-label"><g:link controller="critica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.distribuidora}">
				<li class="fieldcontain">
					<span id="distribuidora-label" class="property-label"><g:message code="musica.distribuidora.label" default="Distribuidora" /></span>
					
						<span class="property-value" aria-labelledby="distribuidora-label"><g:link controller="distribuidora" action="show" id="${musicaInstance?.distribuidora?.id}">${musicaInstance?.distribuidora?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.duracaoMusica}">
				<li class="fieldcontain">
					<span id="duracaoMusica-label" class="property-label"><g:message code="musica.duracaoMusica.label" default="Duracao Musica" /></span>
					
						<span class="property-value" aria-labelledby="duracaoMusica-label"><g:fieldValue bean="${musicaInstance}" field="duracaoMusica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="musica.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:link controller="generoMusica" action="show" id="${musicaInstance?.genero?.id}">${musicaInstance?.genero?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.nomeImg}">
				<li class="fieldcontain">
					<span id="nomeImg-label" class="property-label"><g:message code="musica.nomeImg.label" default="Nome Img" /></span>
					
						<span class="property-value" aria-labelledby="nomeImg-label"><g:fieldValue bean="${musicaInstance}" field="nomeImg"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:musicaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${musicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
