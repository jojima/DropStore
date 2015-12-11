
<%@ page import="br.dropbox.Musica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'musica.label', default: 'Musica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-musica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-musica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'musica.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'musica.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'musica.valorUnitario.label', default: 'Valor Unitario')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'musica.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'musica.ano.label', default: 'Ano')}" />
					
						<th><g:message code="musica.album.label" default="Album" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${musicaInstanceList}" status="i" var="musicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${musicaInstance.id}">${fieldValue(bean: musicaInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: musicaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: musicaInstance, field: "valorUnitario")}</td>
					
						<td>${fieldValue(bean: musicaInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: musicaInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: musicaInstance, field: "album")}</td>
                                                
                                                <td> 
                                                    <img src="${createLinkTo(dir:'Musica/'+ musicaInstance.id, file:''+musicaInstance.nomeImg)}" width="60px" height="60px" />
                                                </td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${musicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
