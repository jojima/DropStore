<%@ page import="br.dropbox.Artista" %>



<div class="fieldcontain ${hasErrors(bean: artistaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="artista.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${artistaInstance?.nome}"/>

</div>

