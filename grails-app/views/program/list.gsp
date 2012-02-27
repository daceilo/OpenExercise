
<%@ page import="org.openexercise.Program" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-program" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-program" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="program.monday.label" default="Monday" /></th>
					
						<th><g:message code="program.tuesday.label" default="Tuesday" /></th>
					
						<th><g:message code="program.wednesday.label" default="Wednesday" /></th>
					
						<th><g:message code="program.thursday.label" default="Thursday" /></th>
					
						<th><g:message code="program.friday.label" default="Friday" /></th>
					
						<th><g:message code="program.saturday.label" default="Saturday" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${programInstanceList}" status="i" var="programInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${programInstance.id}">${fieldValue(bean: programInstance, field: "monday")}</g:link></td>
					
						<td>${fieldValue(bean: programInstance, field: "tuesday")}</td>
					
						<td>${fieldValue(bean: programInstance, field: "wednesday")}</td>
					
						<td>${fieldValue(bean: programInstance, field: "thursday")}</td>
					
						<td>${fieldValue(bean: programInstance, field: "friday")}</td>
					
						<td>${fieldValue(bean: programInstance, field: "saturday")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${programInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
