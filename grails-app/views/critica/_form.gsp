<%@ page import="br.dropbox.Critica" %>



<div class="fieldcontain ${hasErrors(bean: criticaInstance, field: 'autor', 'error')} required">
	<label for="autor">
		<g:message code="critica.autor.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="autor" name="autor.id" from="${br.dropbox.Usuario.list()}" optionKey="id" required="" value="${criticaInstance?.autor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: criticaInstance, field: 'classificacao', 'error')} required">
	<label for="classificacao">
		<g:message code="critica.classificacao.label" default="Classificacao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="classificacao" value="${fieldValue(bean: criticaInstance, field: 'classificacao')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: criticaInstance, field: 'comentario', 'error')} required">
	<label for="comentario">
		<g:message code="critica.comentario.label" default="Comentario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comentario" required="" value="${criticaInstance?.comentario}"/>

</div>

