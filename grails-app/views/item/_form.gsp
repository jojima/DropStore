<%@ page import="br.dropbox.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'indice', 'error')} required">
	<label for="indice">
		<g:message code="item.indice.label" default="Indice" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="indice" type="number" value="${itemInstance.indice}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'quantidade', 'error')} required">
	<label for="quantidade">
		<g:message code="item.quantidade.label" default="Quantidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantidade" type="number" value="${itemInstance.quantidade}" required=""/>

</div>

