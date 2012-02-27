
<%@ page import="org.openexercise.Program" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-program" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-program" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list program">
			
				<g:if test="${programInstance?.monday}">
				<li class="fieldcontain">
					<span id="monday-label" class="property-label"><g:message code="program.monday.label" default="Monday" /></span>
					
						<span class="property-value" aria-labelledby="monday-label"><g:link controller="programDay" action="show" id="${programInstance?.monday?.id}">${programInstance?.monday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.tuesday}">
				<li class="fieldcontain">
					<span id="tuesday-label" class="property-label"><g:message code="program.tuesday.label" default="Tuesday" /></span>
					
						<span class="property-value" aria-labelledby="tuesday-label"><g:link controller="programDay" action="show" id="${programInstance?.tuesday?.id}">${programInstance?.tuesday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.wednesday}">
				<li class="fieldcontain">
					<span id="wednesday-label" class="property-label"><g:message code="program.wednesday.label" default="Wednesday" /></span>
					
						<span class="property-value" aria-labelledby="wednesday-label"><g:link controller="programDay" action="show" id="${programInstance?.wednesday?.id}">${programInstance?.wednesday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.thursday}">
				<li class="fieldcontain">
					<span id="thursday-label" class="property-label"><g:message code="program.thursday.label" default="Thursday" /></span>
					
						<span class="property-value" aria-labelledby="thursday-label"><g:link controller="programDay" action="show" id="${programInstance?.thursday?.id}">${programInstance?.thursday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.friday}">
				<li class="fieldcontain">
					<span id="friday-label" class="property-label"><g:message code="program.friday.label" default="Friday" /></span>
					
						<span class="property-value" aria-labelledby="friday-label"><g:link controller="programDay" action="show" id="${programInstance?.friday?.id}">${programInstance?.friday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.saturday}">
				<li class="fieldcontain">
					<span id="saturday-label" class="property-label"><g:message code="program.saturday.label" default="Saturday" /></span>
					
						<span class="property-value" aria-labelledby="saturday-label"><g:link controller="programDay" action="show" id="${programInstance?.saturday?.id}">${programInstance?.saturday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${programInstance?.sunday}">
				<li class="fieldcontain">
					<span id="sunday-label" class="property-label"><g:message code="program.sunday.label" default="Sunday" /></span>
					
						<span class="property-value" aria-labelledby="sunday-label"><g:link controller="programDay" action="show" id="${programInstance?.sunday?.id}">${programInstance?.sunday?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${programInstance?.id}" />
					<g:link class="edit" action="edit" id="${programInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
