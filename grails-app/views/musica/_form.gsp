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

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'albuns', 'error')} required">
	<label for="albuns">
		<g:message code="musica.albuns.label" default="Albuns" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="albuns" name="albuns.id" from="${br.dropbox.Album.list()}" optionKey="id" required="" value="${musicaInstance?.albuns?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'distribuidoras', 'error')} required">
	<label for="distribuidoras">
		<g:message code="musica.distribuidoras.label" default="Distribuidoras" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="distribuidoras" name="distribuidoras.id" from="${br.dropbox.Distribuidora.list()}" optionKey="id" required="" value="${musicaInstance?.distribuidoras?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'duracaoMusica', 'error')} required">
	<label for="duracaoMusica">
		<g:message code="musica.duracaoMusica.label" default="Duracao Musica" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracaoMusica" type="number" value="${musicaInstance.duracaoMusica}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'generom', 'error')} required">
	<label for="generom">
		<g:message code="musica.generom.label" default="Generom" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="generom" name="generom.id" from="${br.dropbox.GeneroMusica.list()}" optionKey="id" required="" value="${musicaInstance?.generom?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: musicaInstance, field: 'nomeImg', 'error')} required">
	<label for="nomeImg">
		<g:message code="musica.nomeImg.label" default="Nome Img" />
	</label>
	<input type = "file" name="imagem"/>

</div>

