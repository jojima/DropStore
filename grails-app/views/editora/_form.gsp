<%@ page import="br.dropbox.Editora" %>



<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="editora.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${editoraInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: editoraInstance, field: 'livro', 'error')} ">
	<label for="livro">
		<g:message code="editora.livro.label" default="Livro" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${editoraInstance?.livro?}" var="l">
    <li><g:link controller="ebook" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ebook" action="create" params="['editora.id': editoraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ebook.label', default: 'Ebook')])}</g:link>
</li>
</ul>


</div>

