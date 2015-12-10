<%@ page import="br.dropbox.GeneroMusica" %>



<div class="fieldcontain ${hasErrors(bean: generoMusicaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="generoMusica.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${generoMusicaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: generoMusicaInstance, field: 'musica', 'error')} ">
	<label for="musica">
		<g:message code="generoMusica.musica.label" default="Musica" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${generoMusicaInstance?.musica?}" var="m">
    <li><g:link controller="musica" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="musica" action="create" params="['generoMusica.id': generoMusicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'musica.label', default: 'Musica')])}</g:link>
</li>
</ul>


</div>

