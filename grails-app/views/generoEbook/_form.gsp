<%@ page import="br.dropbox.GeneroEbook" %>



<div class="fieldcontain ${hasErrors(bean: generoEbookInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="generoEbook.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${generoEbookInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: generoEbookInstance, field: 'livro', 'error')} ">
	<label for="livro">
		<g:message code="generoEbook.livro.label" default="Livro" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${generoEbookInstance?.livro?}" var="l">
    <li><g:link controller="ebook" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ebook" action="create" params="['generoEbook.id': generoEbookInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ebook.label', default: 'Ebook')])}</g:link>
</li>
</ul>


</div>

