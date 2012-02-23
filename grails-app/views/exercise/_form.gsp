<%@ page import="org.openexercise.Exercise" %>



<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="exercise.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${exerciseInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="exercise.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${exerciseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'instructions', 'error')} ">
	<label for="instructions">
		<g:message code="exercise.instructions.label" default="Instructions" />
		
	</label>
	<g:textField name="instructions" value="${exerciseInstance?.instructions}"/>
</div>

