
<%@ page import="org.openexercise.ProgramDay" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'programDay.label', default: 'ProgramDay')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-programDay" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-programDay" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dayOfWeek" title="${message(code: 'programDay.dayOfWeek.label', default: 'Day Of Week')}" />
					
						<th><g:message code="programDay.program.label" default="Program" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${programDayInstanceList}" status="i" var="programDayInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${programDayInstance.id}">${fieldValue(bean: programDayInstance, field: "dayOfWeek")}</g:link></td>
					
						<td>${fieldValue(bean: programDayInstance, field: "program")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${programDayInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
