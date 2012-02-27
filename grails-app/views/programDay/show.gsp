
<%@ page import="org.openexercise.ProgramDay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'programDay.label', default: 'ProgramDay')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-programDay" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-programDay" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list programDay">
			
				<g:if test="${programDayInstance?.dayOfWeek}">
				<li class="fieldcontain">
					<span id="dayOfWeek-label" class="property-label"><g:message code="programDay.dayOfWeek.label" default="Day Of Week" /></span>
					
						<span class="property-value" aria-labelledby="dayOfWeek-label"><g:fieldValue bean="${programDayInstance}" field="dayOfWeek"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${programDayInstance?.exerciseBundles}">
				<li class="fieldcontain">
					<span id="exerciseBundles-label" class="property-label"><g:message code="programDay.exerciseBundles.label" default="Exercise Bundles" /></span>
					
						<g:each in="${programDayInstance.exerciseBundles}" var="e">
						<span class="property-value" aria-labelledby="exerciseBundles-label"><g:link controller="exerciseBundle" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${programDayInstance?.program}">
				<li class="fieldcontain">
					<span id="program-label" class="property-label"><g:message code="programDay.program.label" default="Program" /></span>
					
						<span class="property-value" aria-labelledby="program-label"><g:link controller="program" action="show" id="${programDayInstance?.program?.id}">${programDayInstance?.program?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${programDayInstance?.id}" />
					<g:link class="edit" action="edit" id="${programDayInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
