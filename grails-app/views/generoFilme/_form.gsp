<%@ page import="br.dropbox.GeneroFilme" %>



<div class="fieldcontain ${hasErrors(bean: generoFilmeInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="generoFilme.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${generoFilmeInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: generoFilmeInstance, field: 'filme', 'error')} ">
	<label for="filme">
		<g:message code="generoFilme.filme.label" default="Filme" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${generoFilmeInstance?.filme?}" var="f">
    <li><g:link controller="filme" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="filme" action="create" params="['generoFilme.id': generoFilmeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'filme.label', default: 'Filme')])}</g:link>
</li>
</ul>


</div>

