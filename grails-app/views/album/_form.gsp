<%@ page import="br.dropbox.Album" %>



<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="album.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${albumInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'listaMusicas', 'error')} ">
	<label for="listaMusicas">
		<g:message code="album.listaMusicas.label" default="Lista Musicas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${albumInstance?.listaMusicas?}" var="l">
    <li><g:link controller="musica" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="musica" action="create" params="['album.id': albumInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'musica.label', default: 'Musica')])}</g:link>
</li>
</ul>


</div>

