<%@ page import="br.dropbox.Estudio" %>



<div class="fieldcontain ${hasErrors(bean: estudioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="estudio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${estudioInstance?.nome}"/>

</div>

