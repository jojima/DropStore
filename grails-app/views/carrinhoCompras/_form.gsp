<%@ page import="br.dropbox.CarrinhoCompras" %>



<div class="fieldcontain ${hasErrors(bean: carrinhoComprasInstance, field: 'dataDeFinalizacao', 'error')} required">
	<label for="dataDeFinalizacao">
		<g:message code="carrinhoCompras.dataDeFinalizacao.label" default="Data De Finalizacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataDeFinalizacao" precision="day"  value="${carrinhoComprasInstance?.dataDeFinalizacao}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: carrinhoComprasInstance, field: 'valorTotal', 'error')} required">
	<label for="valorTotal">
		<g:message code="carrinhoCompras.valorTotal.label" default="Valor Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorTotal" value="${fieldValue(bean: carrinhoComprasInstance, field: 'valorTotal')}" required=""/>

</div>

