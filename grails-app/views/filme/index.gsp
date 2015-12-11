
<%@ page import="br.dropbox.Filme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'filme.label', default: 'Filme')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-filme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-filme" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'filme.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'filme.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'filme.valorUnitario.label', default: 'Valor Unitario')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'filme.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'filme.ano.label', default: 'Ano')}" />
					
						<th><g:message code="filme.diretor.label" default="Diretor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${filmeInstanceList}" status="i" var="filmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${filmeInstance.id}">${fieldValue(bean: filmeInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: filmeInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: filmeInstance, field: "valorUnitario")}</td>
					
						<td>${fieldValue(bean: filmeInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: filmeInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: filmeInstance, field: "diretor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${filmeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
