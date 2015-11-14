
<%@ page import="br.dropbox.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pedido" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dataPedido" title="${message(code: 'pedido.dataPedido.label', default: 'Data Pedido')}" />
					
						<g:sortableColumn property="opcao" title="${message(code: 'pedido.opcao.label', default: 'Opcao')}" />
					
						<g:sortableColumn property="pagamentoEfetuado" title="${message(code: 'pedido.pagamentoEfetuado.label', default: 'Pagamento Efetuado')}" />
					
						<g:sortableColumn property="pedidoAtivo" title="${message(code: 'pedido.pedidoAtivo.label', default: 'Pedido Ativo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "dataPedido")}</g:link></td>
					
						<td>${fieldValue(bean: pedidoInstance, field: "opcao")}</td>
					
						<td><g:formatBoolean boolean="${pedidoInstance.pagamentoEfetuado}" /></td>
					
						<td><g:formatBoolean boolean="${pedidoInstance.pedidoAtivo}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pedidoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
