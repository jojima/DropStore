<%@ page import="br.dropbox.Diretor" %>



<div class="fieldcontain ${hasErrors(bean: diretorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="diretor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${diretorInstance?.nome}"/>

</div>

