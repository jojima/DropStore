<%@ page import="br.dropbox.Distribuidora" %>



<div class="fieldcontain ${hasErrors(bean: distribuidoraInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="distribuidora.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${distribuidoraInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: distribuidoraInstance, field: 'musicas', 'error')} ">
	<label for="musicas">
		<g:message code="distribuidora.musicas.label" default="Musicas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${distribuidoraInstance?.musicas?}" var="m">
    <li><g:link controller="musica" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="musica" action="create" params="['distribuidora.id': distribuidoraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'musica.label', default: 'Musica')])}</g:link>
</li>
</ul>


</div>

