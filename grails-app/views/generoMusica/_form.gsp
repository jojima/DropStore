<%@ page import="br.dropbox.GeneroMusica" %>



<div class="fieldcontain ${hasErrors(bean: generoMusicaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="generoMusica.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${generoMusicaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: generoMusicaInstance, field: 'genMusica', 'error')} ">
	<label for="genMusica">
		<g:message code="generoMusica.genMusica.label" default="Gen Musica" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${generoMusicaInstance?.genMusica?}" var="g">
    <li><g:link controller="musica" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="musica" action="create" params="['generoMusica.id': generoMusicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'musica.label', default: 'Musica')])}</g:link>
</li>
</ul>


</div>

