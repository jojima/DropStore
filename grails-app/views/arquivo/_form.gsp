<%@ page import="br.dropbox.Arquivo" %>



<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="arquivo.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${arquivoInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="arquivo.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" required="" value="${arquivoInstance?.tipo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'dataCriacao', 'error')} required">
	<label for="dataCriacao">
		<g:message code="arquivo.dataCriacao.label" default="Data Criacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dataCriacao" type="number" value="${arquivoInstance.dataCriacao}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: arquivoInstance, field: 'tamanho', 'error')} required">
	<label for="tamanho">
		<g:message code="arquivo.tamanho.label" default="Tamanho" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tamanho" type="number" value="${arquivoInstance.tamanho}" required=""/>

</div>

