<%@ page import="org.openexercise.BlogEntry" %>



<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'sleepTime', 'error')} ">
	<label for="sleepTime">
		<g:message code="blogEntry.sleepTime.label" default="Sleep Time" />
		
	</label>
	<g:field type="number" name="sleepTime" value="${fieldValue(bean: blogEntryInstance, field: 'sleepTime')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'weight', 'error')} ">
	<label for="weight">
		<g:message code="blogEntry.weight.label" default="Weight" />
		
	</label>
	<g:field type="number" name="weight" value="${fieldValue(bean: blogEntryInstance, field: 'weight')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blogEntryInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="blogEntry.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${org.openexercise.User.list()}" optionKey="id" required="" value="${blogEntryInstance?.user?.id}" class="many-to-one"/>
</div>

