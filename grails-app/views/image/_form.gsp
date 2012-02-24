<%@ page import="org.openexercise.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="image.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="data" name="data" />
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'exercise', 'error')} required">
	<label for="exercise">
		<g:message code="image.exercise.label" default="Exercise" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exercise" name="exercise.id" from="${org.openexercise.Exercise.list()}" optionKey="id" required="" value="${imageInstance?.exercise?.id}" class="many-to-one"/>
</div>

