
<%@ page import="br.dropbox.Ebook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ebook.label', default: 'Ebook')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ebook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ebook" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ebook">
			
				<g:if test="${ebookInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="ebook.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${ebookInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="ebook.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${ebookInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.valorUnitario}">
				<li class="fieldcontain">
					<span id="valorUnitario-label" class="property-label"><g:message code="ebook.valorUnitario.label" default="Valor Unitario" /></span>
					
						<span class="property-value" aria-labelledby="valorUnitario-label"><g:fieldValue bean="${ebookInstance}" field="valorUnitario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="ebook.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${ebookInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.ano}">
				<li class="fieldcontain">
					<span id="ano-label" class="property-label"><g:message code="ebook.ano.label" default="Ano" /></span>
					
						<span class="property-value" aria-labelledby="ano-label"><g:fieldValue bean="${ebookInstance}" field="ano"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.numPaginas}">
				<li class="fieldcontain">
					<span id="numPaginas-label" class="property-label"><g:message code="ebook.numPaginas.label" default="Num Paginas" /></span>
					
						<span class="property-value" aria-labelledby="numPaginas-label"><g:fieldValue bean="${ebookInstance}" field="numPaginas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.autor}">
				<li class="fieldcontain">
					<span id="autor-label" class="property-label"><g:message code="ebook.autor.label" default="Autor" /></span>
					
						<span class="property-value" aria-labelledby="autor-label"><g:link controller="autor" action="show" id="${ebookInstance?.autor?.id}">${ebookInstance?.autor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.criticas}">
				<li class="fieldcontain">
					<span id="criticas-label" class="property-label"><g:message code="ebook.criticas.label" default="Criticas" /></span>
					
						<g:each in="${ebookInstance.criticas}" var="c">
						<span class="property-value" aria-labelledby="criticas-label"><g:link controller="critica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.editora}">
				<li class="fieldcontain">
					<span id="editora-label" class="property-label"><g:message code="ebook.editora.label" default="Editora" /></span>
					
						<span class="property-value" aria-labelledby="editora-label"><g:link controller="editora" action="show" id="${ebookInstance?.editora?.id}">${ebookInstance?.editora?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="ebook.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:link controller="generoEbook" action="show" id="${ebookInstance?.genero?.id}">${ebookInstance?.genero?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ebookInstance?.nomeImg}">
				<li class="fieldcontain">
					<span id="nomeImg-label" class="property-label"><g:message code="ebook.nomeImg.label" default="Nome Img" /></span>
					
						<span class="property-value" aria-labelledby="nomeImg-label"><g:fieldValue bean="${ebookInstance}" field="nomeImg"/>
                                                    <img src="${createLinkTo(dir:'Ebook/'+ ebookInstance.id, file:''+ebookInstance.nomeImg)}" alt="${ebookInstance.nomeImg}" title="${ebookInstance.nomeImg}" width="120px" height="120px"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ebookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ebookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
