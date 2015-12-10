<%@ page import="br.dropbox.Autor" %>



<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="autor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${autorInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: autorInstance, field: 'livro', 'error')} ">
	<label for="livro">
		<g:message code="autor.livro.label" default="Livro" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${autorInstance?.livro?}" var="l">
    <li><g:link controller="ebook" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ebook" action="create" params="['autor.id': autorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ebook.label', default: 'Ebook')])}</g:link>
</li>
</ul>


</div>

