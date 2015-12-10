<%@ page import="br.dropbox.Diretor" %>



<div class="fieldcontain ${hasErrors(bean: diretorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="diretor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${diretorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diretorInstance, field: 'filme', 'error')} ">
	<label for="filme">
		<g:message code="diretor.filme.label" default="Filme" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${diretorInstance?.filme?}" var="f">
    <li><g:link controller="filme" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="filme" action="create" params="['diretor.id': diretorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'filme.label', default: 'Filme')])}</g:link>
</li>
</ul>


</div>

