
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
			
				<g:if test="${musicaInstance?.albuns}">
				<li class="fieldcontain">
					<span id="albuns-label" class="property-label"><g:message code="musica.albuns.label" default="Albuns" /></span>
					
						<span class="property-value" aria-labelledby="albuns-label"><g:link controller="album" action="show" id="${musicaInstance?.albuns?.id}">${musicaInstance?.albuns?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.distribuidoras}">
				<li class="fieldcontain">
					<span id="distribuidoras-label" class="property-label"><g:message code="musica.distribuidoras.label" default="Distribuidoras" /></span>
					
						<span class="property-value" aria-labelledby="distribuidoras-label"><g:link controller="distribuidora" action="show" id="${musicaInstance?.distribuidoras?.id}">${musicaInstance?.distribuidoras?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.duracaoMusica}">
				<li class="fieldcontain">
					<span id="duracaoMusica-label" class="property-label"><g:message code="musica.duracaoMusica.label" default="Duracao Musica" /></span>
					
						<span class="property-value" aria-labelledby="duracaoMusica-label"><g:fieldValue bean="${musicaInstance}" field="duracaoMusica"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${musicaInstance?.generom}">
				<li class="fieldcontain">
					<span id="generom-label" class="property-label"><g:message code="musica.generom.label" default="Generom" /></span>
					
						<span class="property-value" aria-labelledby="generom-label"><g:link controller="generoMusica" action="show" id="${musicaInstance?.generom?.id}">${musicaInstance?.generom?.encodeAsHTML()}</g:link></span>
					
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
