
<%@ page import="br.dropbox.Ebook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ebook.label', default: 'Ebook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ebook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ebook" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'ebook.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'ebook.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'ebook.valorUnitario.label', default: 'Valor Unitario')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'ebook.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'ebook.ano.label', default: 'Ano')}" />
					
						<g:sortableColumn property="numPaginas" title="${message(code: 'ebook.numPaginas.label', default: 'Num Paginas')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ebookInstanceList}" status="i" var="ebookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ebookInstance.id}">${fieldValue(bean: ebookInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: ebookInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: ebookInstance, field: "valorUnitario")}</td>
					
						<td>${fieldValue(bean: ebookInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: ebookInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: ebookInstance, field: "numPaginas")}</td>
                                                
                                                <td> 
                                                    <img src="${createLinkTo(dir:'Ebook/'+ ebookInstance.id, file:''+ebookInstance.nomeImg)}" width="60px" height="60px" />
                                                </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ebookInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
