
<%@ page import="br.dropbox.CarrinhoCompras" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrinhoCompras.label', default: 'CarrinhoCompras')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-carrinhoCompras" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carrinhoCompras" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dataDeFinalizacao" title="${message(code: 'carrinhoCompras.dataDeFinalizacao.label', default: 'Data De Finalizacao')}" />
					
						<g:sortableColumn property="valorTotal" title="${message(code: 'carrinhoCompras.valorTotal.label', default: 'Valor Total')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carrinhoComprasInstanceList}" status="i" var="carrinhoComprasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carrinhoComprasInstance.id}">${fieldValue(bean: carrinhoComprasInstance, field: "dataDeFinalizacao")}</g:link></td>
					
						<td>${fieldValue(bean: carrinhoComprasInstance, field: "valorTotal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carrinhoComprasInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
