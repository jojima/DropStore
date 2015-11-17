<%@ page import="br.dropbox.Ebook" %>



<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="ebook.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${ebookInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="ebook.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${ebookInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'valorUnitario', 'error')} required">
	<label for="valorUnitario">
		<g:message code="ebook.valorUnitario.label" default="Valor Unitario" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorUnitario" value="${fieldValue(bean: ebookInstance, field: 'valorUnitario')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="ebook.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: ebookInstance, field: 'nota')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'ano', 'error')} required">
	<label for="ano">
		<g:message code="ebook.ano.label" default="Ano" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ano" type="number" min="1500" value="${ebookInstance.ano}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'numPaginas', 'error')} required">
	<label for="numPaginas">
		<g:message code="ebook.numPaginas.label" default="Num Paginas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numPaginas" type="number" value="${ebookInstance.numPaginas}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'generos', 'error')} required">
	<label for="generos">
		<g:message code="ebook.generos.label" default="Generos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="generos" name="generos.id" from="${br.dropbox.GeneroEbook.list()}" optionKey="id" required="" value="${ebookInstance?.generos?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'nomeImg', 'error')} required">
	<label for="nomeImg">
		<g:message code="ebook.nomeImg.label" default="Nome Img" />
	</label>
	<input type = "file" name="imagem"/>

</div>

