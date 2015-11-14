<%@ page import="br.dropbox.Editora" %>



<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="editora.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${editoraInstance?.nome}"/>

</div>

