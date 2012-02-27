<%@ page import="org.openexercise.Program" %>



<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'monday', 'error')} required">
	<label for="monday">
		<g:message code="program.monday.label" default="Monday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="monday" name="monday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.monday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'tuesday', 'error')} required">
	<label for="tuesday">
		<g:message code="program.tuesday.label" default="Tuesday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tuesday" name="tuesday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.tuesday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'wednesday', 'error')} required">
	<label for="wednesday">
		<g:message code="program.wednesday.label" default="Wednesday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wednesday" name="wednesday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.wednesday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'thursday', 'error')} required">
	<label for="thursday">
		<g:message code="program.thursday.label" default="Thursday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="thursday" name="thursday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.thursday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'friday', 'error')} required">
	<label for="friday">
		<g:message code="program.friday.label" default="Friday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="friday" name="friday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.friday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'saturday', 'error')} required">
	<label for="saturday">
		<g:message code="program.saturday.label" default="Saturday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="saturday" name="saturday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.saturday?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: programInstance, field: 'sunday', 'error')} required">
	<label for="sunday">
		<g:message code="program.sunday.label" default="Sunday" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sunday" name="sunday.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${programInstance?.sunday?.id}" class="many-to-one"/>
</div>

