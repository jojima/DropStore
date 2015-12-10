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

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'autor', 'error')} required">
	<label for="autor">
		<g:message code="ebook.autor.label" default="Autor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="autor" name="autor.id" from="${br.dropbox.Autor.list()}" optionKey="id" required="" value="${ebookInstance?.autor?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'editora', 'error')} required">
	<label for="editora">
		<g:message code="ebook.editora.label" default="Editora" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="editora" name="editora.id" from="${br.dropbox.Editora.list()}" optionKey="id" required="" value="${ebookInstance?.editora?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'genero', 'error')} required">
	<label for="genero">
		<g:message code="ebook.genero.label" default="Genero" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="genero" name="genero.id" from="${br.dropbox.GeneroEbook.list()}" optionKey="id" required="" value="${ebookInstance?.genero?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ebookInstance, field: 'nomeImg', 'error')} required">
	<label for="nomeImg">
		<g:message code="ebook.nomeImg.label" default="Nome Img" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nomeImg" required="" value="${ebookInstance?.nomeImg}"/>

</div>

