
<%@ page import="br.dropbox.Arquivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'arquivo.label', default: 'Arquivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-arquivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                            </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="list-arquivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'arquivo.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'arquivo.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="dataCriacao" title="${message(code: 'arquivo.dataCriacao.label', default: 'Data Criacao')}" />
					
						<g:sortableColumn property="tamanho" title="${message(code: 'arquivo.tamanho.label', default: 'Tamanho')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${arquivoInstanceList}" status="i" var="arquivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${arquivoInstance.id}">${fieldValue(bean: arquivoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: arquivoInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: arquivoInstance, field: "dataCriacao")}</td>
					
						<td>${fieldValue(bean: arquivoInstance, field: "tamanho")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${arquivoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
