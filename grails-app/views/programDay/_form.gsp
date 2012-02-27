<%@ page import="org.openexercise.ProgramDay" %>



<div class="fieldcontain ${hasErrors(bean: programDayInstance, field: 'dayOfWeek', 'error')} required">
	<label for="dayOfWeek">
		<g:message code="programDay.dayOfWeek.label" default="Day Of Week" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dayOfWeek" required="" value="${programDayInstance?.dayOfWeek}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programDayInstance, field: 'exerciseBundles', 'error')} ">
	<label for="exerciseBundles">
		<g:message code="programDay.exerciseBundles.label" default="Exercise Bundles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${programDayInstance?.exerciseBundles?}" var="e">
    <li><g:link controller="exerciseBundle" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="exerciseBundle" action="create" params="['programDay.id': programDayInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exerciseBundle.label', default: 'ExerciseBundle')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: programDayInstance, field: 'program', 'error')} required">
	<label for="program">
		<g:message code="programDay.program.label" default="Program" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="program" name="program.id" from="${org.openexercise.Program.list()}" optionKey="id" required="" value="${programDayInstance?.program?.id}" class="many-to-one"/>
</div>

