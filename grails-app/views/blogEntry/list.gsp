
<%@ page import="org.openexercise.BlogEntry" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogEntry.label', default: 'BlogEntry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blogEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blogEntry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="id" title="${message(code: 'blogEntry.id.label', default:
                                'ID')}" />

						<g:sortableColumn property="sleepTime" title="${message(code: 'blogEntry.sleepTime.label', default: 'Sleep Time')}" />
					
						<g:sortableColumn property="weight" title="${message(code: 'blogEntry.weight.label', default: 'Weight')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'blogEntry.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'blogEntry.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="blogEntry.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogEntryInstanceList}" status="i" var="blogEntryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${blogEntryInstance.id}">${fieldValue(bean: blogEntryInstance,
                                field: "id")}</g:link></td>

                        <td>${fieldValue(bean: blogEntryInstance, field: "sleepTime")}</td>

						<td>${fieldValue(bean: blogEntryInstance, field: "weight")}</td>
					
						<td><g:formatDate date="${blogEntryInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${blogEntryInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: blogEntryInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blogEntryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
