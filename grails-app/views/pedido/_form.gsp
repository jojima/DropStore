<%@ page import="br.dropbox.Pedido" %>



<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'dataPedido', 'error')} required">
	<label for="dataPedido">
		<g:message code="pedido.dataPedido.label" default="Data Pedido" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataPedido" precision="day"  value="${pedidoInstance?.dataPedido}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'opcao', 'error')} required">
	<label for="opcao">
		<g:message code="pedido.opcao.label" default="Opcao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="opcao" from="${pedidoInstance.constraints.opcao.inList}" required="" value="${pedidoInstance?.opcao}" valueMessagePrefix="pedido.opcao"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'pagamentoEfetuado', 'error')} ">
	<label for="pagamentoEfetuado">
		<g:message code="pedido.pagamentoEfetuado.label" default="Pagamento Efetuado" />
		
	</label>
	<g:checkBox name="pagamentoEfetuado" value="${pedidoInstance?.pagamentoEfetuado}" />

</div>

<div class="fieldcontain ${hasErrors(bean: pedidoInstance, field: 'pedidoAtivo', 'error')} ">
	<label for="pedidoAtivo">
		<g:message code="pedido.pedidoAtivo.label" default="Pedido Ativo" />
		
	</label>
	<g:checkBox name="pedidoAtivo" value="${pedidoInstance?.pedidoAtivo}" />

</div>

