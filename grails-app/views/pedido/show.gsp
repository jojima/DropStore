
<%@ page import="br.dropbox.Pedido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pedido" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pedido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pedido">
			
				<g:if test="${pedidoInstance?.dataPedido}">
				<li class="fieldcontain">
					<span id="dataPedido-label" class="property-label"><g:message code="pedido.dataPedido.label" default="Data Pedido" /></span>
					
						<span class="property-value" aria-labelledby="dataPedido-label"><g:formatDate date="${pedidoInstance?.dataPedido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.opcao}">
				<li class="fieldcontain">
					<span id="opcao-label" class="property-label"><g:message code="pedido.opcao.label" default="Opcao" /></span>
					
						<span class="property-value" aria-labelledby="opcao-label"><g:fieldValue bean="${pedidoInstance}" field="opcao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.pagamentoEfetuado}">
				<li class="fieldcontain">
					<span id="pagamentoEfetuado-label" class="property-label"><g:message code="pedido.pagamentoEfetuado.label" default="Pagamento Efetuado" /></span>
					
						<span class="property-value" aria-labelledby="pagamentoEfetuado-label"><g:formatBoolean boolean="${pedidoInstance?.pagamentoEfetuado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pedidoInstance?.pedidoAtivo}">
				<li class="fieldcontain">
					<span id="pedidoAtivo-label" class="property-label"><g:message code="pedido.pedidoAtivo.label" default="Pedido Ativo" /></span>
					
						<span class="property-value" aria-labelledby="pedidoAtivo-label"><g:formatBoolean boolean="${pedidoInstance?.pedidoAtivo}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pedidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pedidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
