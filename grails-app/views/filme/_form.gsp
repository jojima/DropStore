<%@ page import="br.dropbox.Filme" %>



<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="filme.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${filmeInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="filme.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${filmeInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'valorUnitario', 'error')} required">
	<label for="valorUnitario">
		<g:message code="filme.valorUnitario.label" default="Valor Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorUnitario" value="${fieldValue(bean: filmeInstance, field: 'valorUnitario')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="filme.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: filmeInstance, field: 'nota')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="filme.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" min="1500" value="${filmeInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'diretor', 'error')} required">
	<label for="diretor">
		<g:message code="filme.diretor.label" default="Diretor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="diretor" name="diretor.id" from="${br.dropbox.Diretor.list()}" optionKey="id" required="" value="${filmeInstance?.diretor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'duracaoFilme', 'error')} required">
	<label for="duracaoFilme">
		<g:message code="filme.duracaoFilme.label" default="Duracao Filme" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duracaoFilme" type="number" value="${filmeInstance.duracaoFilme}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'estudio', 'error')} required">
	<label for="estudio">
		<g:message code="filme.estudio.label" default="Estudio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estudio" name="estudio.id" from="${br.dropbox.Estudio.list()}" optionKey="id" required="" value="${filmeInstance?.estudio?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'genero', 'error')} required">
	<label for="genero">
		<g:message code="filme.genero.label" default="Genero" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genero" name="genero.id" from="${br.dropbox.GeneroFilme.list()}" optionKey="id" required="" value="${filmeInstance?.genero?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: filmeInstance, field: 'nomeImg', 'error')} required">
	<label for="nomeImg">
		<g:message code="filme.nomeImg.label" default="Nome Img" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeImg" required="" value="${filmeInstance?.nomeImg}"/>

</div>

