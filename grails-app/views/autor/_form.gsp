<%@ page import="br.dropbox.Autor" %>



<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="autor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${autorInstance?.nome}"/>

</div>

