<%@ page import="br.dropbox.Produto" %>



<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="produto.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" value="${produtoInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="produto.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${produtoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="produto.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: produtoInstance, field: 'nota')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="produto.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${produtoInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: produtoInstance, field: 'valorUnitario', 'error')} required">
	<label for="valorUnitario">
		<g:message code="produto.valorUnitario.label" default="Valor Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorUnitario" value="${fieldValue(bean: produtoInstance, field: 'valorUnitario')}" required=""/>

</div>

