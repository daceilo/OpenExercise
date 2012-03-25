
<%@ page import="org.openexercise.BlogEntry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'BlogEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blogEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blogEntry">
			
				<g:if test="${blogEntryInstance?.sleepTime}">
				<li class="fieldcontain">
					<span id="sleepTime-label" class="property-label"><g:message code="blogEntry.sleepTime.label" default="Sleep Time" /></span>
					
						<span class="property-value" aria-labelledby="sleepTime-label"><g:fieldValue bean="${blogEntryInstance}" field="sleepTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="blogEntry.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${blogEntryInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="blogEntry.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${blogEntryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="blogEntry.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${blogEntryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogEntryInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="blogEntry.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${blogEntryInstance?.user?.id}">${blogEntryInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${blogEntryInstance?.id}" />
					<g:link class="edit" action="edit" id="${blogEntryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
