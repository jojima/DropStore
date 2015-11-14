
<%@ page import="br.dropbox.GeneroFilme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'generoFilme.label', default: 'GeneroFilme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-generoFilme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-generoFilme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list generoFilme">
			
				<g:if test="${generoFilmeInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="generoFilme.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${generoFilmeInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${generoFilmeInstance?.filmes}">
				<li class="fieldcontain">
					<span id="filmes-label" class="property-label"><g:message code="generoFilme.filmes.label" default="Filmes" /></span>
					
						<g:each in="${generoFilmeInstance.filmes}" var="f">
						<span class="property-value" aria-labelledby="filmes-label"><g:link controller="filme" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:generoFilmeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${generoFilmeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
