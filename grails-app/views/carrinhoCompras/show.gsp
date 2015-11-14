
<%@ page import="br.dropbox.CarrinhoCompras" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrinhoCompras.label', default: 'CarrinhoCompras')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-carrinhoCompras" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-carrinhoCompras" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list carrinhoCompras">
			
				<g:if test="${carrinhoComprasInstance?.dataDeFinalizacao}">
				<li class="fieldcontain">
					<span id="dataDeFinalizacao-label" class="property-label"><g:message code="carrinhoCompras.dataDeFinalizacao.label" default="Data De Finalizacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDeFinalizacao-label"><g:formatDate date="${carrinhoComprasInstance?.dataDeFinalizacao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${carrinhoComprasInstance?.valorTotal}">
				<li class="fieldcontain">
					<span id="valorTotal-label" class="property-label"><g:message code="carrinhoCompras.valorTotal.label" default="Valor Total" /></span>
					
						<span class="property-value" aria-labelledby="valorTotal-label"><g:fieldValue bean="${carrinhoComprasInstance}" field="valorTotal"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:carrinhoComprasInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${carrinhoComprasInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
