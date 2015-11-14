
<%@ page import="br.dropbox.Filme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'filme.label', default: 'Filme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-filme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-filme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list filme">
			
				<g:if test="${filmeInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="filme.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${filmeInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="filme.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${filmeInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.valorUnitario}">
				<li class="fieldcontain">
					<span id="valorUnitario-label" class="property-label"><g:message code="filme.valorUnitario.label" default="Valor Unitario" /></span>
					
						<span class="property-value" aria-labelledby="valorUnitario-label"><g:fieldValue bean="${filmeInstance}" field="valorUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="filme.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${filmeInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="filme.ano.label" default="Ano" /></span>
					
						<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${filmeInstance}" field="ano"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.duracaoFilme}">
				<li class="fieldcontain">
					<span id="duracaoFilme-label" class="property-label"><g:message code="filme.duracaoFilme.label" default="Duracao Filme" /></span>
					
						<span class="property-value" aria-labelledby="duracaoFilme-label"><g:fieldValue bean="${filmeInstance}" field="duracaoFilme"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${filmeInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="filme.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:link controller="generoFilme" action="show" id="${filmeInstance?.genero?.id}">${filmeInstance?.genero?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:filmeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${filmeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
