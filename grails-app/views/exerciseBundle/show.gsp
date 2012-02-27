
<%@ page import="org.openexercise.ExerciseBundle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'exerciseBundle.label', default: 'ExerciseBundle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-exerciseBundle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-exerciseBundle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list exerciseBundle">
			
				<g:if test="${exerciseBundleInstance?.exercise}">
				<li class="fieldcontain">
					<span id="exercise-label" class="property-label"><g:message code="exerciseBundle.exercise.label" default="Exercise" /></span>
					
						<span class="property-value" aria-labelledby="exercise-label"><g:link controller="exercise" action="show" id="${exerciseBundleInstance?.exercise?.id}">${exerciseBundleInstance?.exercise?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${exerciseBundleInstance?.repetitions}">
				<li class="fieldcontain">
					<span id="repetitions-label" class="property-label"><g:message code="exerciseBundle.repetitions.label" default="Repetitions" /></span>
					
						<span class="property-value" aria-labelledby="repetitions-label"><g:fieldValue bean="${exerciseBundleInstance}" field="repetitions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exerciseBundleInstance?.durationInSeconds}">
				<li class="fieldcontain">
					<span id="durationInSeconds-label" class="property-label"><g:message code="exerciseBundle.durationInSeconds.label" default="Duration In Seconds" /></span>
					
						<span class="property-value" aria-labelledby="durationInSeconds-label"><g:fieldValue bean="${exerciseBundleInstance}" field="durationInSeconds"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${exerciseBundleInstance?.programDay}">
				<li class="fieldcontain">
					<span id="programDay-label" class="property-label"><g:message code="exerciseBundle.programDay.label" default="Program Day" /></span>
					
						<span class="property-value" aria-labelledby="programDay-label"><g:link controller="programDay" action="show" id="${exerciseBundleInstance?.programDay?.id}">${exerciseBundleInstance?.programDay?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${exerciseBundleInstance?.id}" />
					<g:link class="edit" action="edit" id="${exerciseBundleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
