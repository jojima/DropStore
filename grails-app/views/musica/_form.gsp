<%@ page import="br.dropbox.Musica" %>



<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="musica.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${musicaInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="musica.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${musicaInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'valorUnitario', 'error')} required">
	<label for="valorUnitario">
		<g:message code="musica.valorUnitario.label" default="Valor Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorUnitario" value="${fieldValue(bean: musicaInstance, field: 'valorUnitario')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="musica.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: musicaInstance, field: 'nota')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="musica.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" min="1500" value="${musicaInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'album', 'error')} required">
	<label for="album">
		<g:message code="musica.album.label" default="Album" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="album" name="album.id" from="${br.dropbox.Album.list()}" optionKey="id" required="" value="${musicaInstance?.album?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'artista', 'error')} required">
	<label for="artista">
		<g:message code="musica.artista.label" default="Artista" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="artista" name="artista.id" from="${br.dropbox.Artista.list()}" optionKey="id" required="" value="${musicaInstance?.artista?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'criticas', 'error')} ">
	<label for="criticas">
		<g:message code="musica.criticas.label" default="Criticas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${musicaInstance?.criticas?}" var="c">
    <li><g:link controller="critica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="critica" action="create" params="['musica.id': musicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'critica.label', default: 'Critica')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'distribuidora', 'error')} required">
	<label for="distribuidora">
		<g:message code="musica.distribuidora.label" default="Distribuidora" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="distribuidora" name="distribuidora.id" from="${br.dropbox.Distribuidora.list()}" optionKey="id" required="" value="${musicaInstance?.distribuidora?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'duracaoMusica', 'error')} required">
	<label for="duracaoMusica">
		<g:message code="musica.duracaoMusica.label" default="Duracao Musica" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracaoMusica" type="number" value="${musicaInstance.duracaoMusica}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'genero', 'error')} required">
	<label for="genero">
		<g:message code="musica.genero.label" default="Genero" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genero" name="genero.id" from="${br.dropbox.GeneroMusica.list()}" optionKey="id" required="" value="${musicaInstance?.genero?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'nomeImg', 'error')} required">
	<label for="nomeImg">
		<g:message code="musica.nomeImg.label" default="Nome Img" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeImg" required="" value="${musicaInstance?.nomeImg}"/>

</div>

