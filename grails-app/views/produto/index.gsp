
<%@ page import="br.dropbox.Produto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'produto.label', default: 'Produto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-produto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <sec:ifAnyGranted roles="ROLE_ADMIN">
                                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                                </sec:ifAnyGranted>
			</ul>
		</div>
		<div id="list-produto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'produto.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'produto.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorUnitario" title="${message(code: 'produto.valorUnitario.label', default: 'Valor Unitario')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'produto.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="ano" title="${message(code: 'produto.ano.label', default: 'Ano')}" />
					
						<g:sortableColumn property="nomeImg" title="${message(code: 'produto.nomeImg.label', default: 'Nome Img')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${produtoInstanceList}" status="i" var="produtoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${produtoInstance.id}">${fieldValue(bean: produtoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: produtoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "valorUnitario")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "ano")}</td>
					
						<td>${fieldValue(bean: produtoInstance, field: "nomeImg")}</td>
                                                
                                                <td> 
                                                    <img src="${createLinkTo(dir:'Produto/'+ produtoInstance.id, file:''+produtoInstance.nomeImg)}" width="60px" height="60px" />
                                                </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${produtoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
