<%@ page import="br.dropbox.Estudio" %>



<div class="fieldcontain ${hasErrors(bean: estudioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="estudio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${estudioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estudioInstance, field: 'filme', 'error')} ">
	<label for="filme">
		<g:message code="estudio.filme.label" default="Filme" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estudioInstance?.filme?}" var="f">
    <li><g:link controller="filme" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="filme" action="create" params="['estudio.id': estudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'filme.label', default: 'Filme')])}</g:link>
</li>
</ul>


</div>

