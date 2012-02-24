<%@ page import="org.openexercise.ExerciseType" %>



<div class="fieldcontain ${hasErrors(bean: exerciseTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="exerciseType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${exerciseTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="exerciseType.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${exerciseTypeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseTypeInstance, field: 'exercicses', 'error')} ">
	<label for="exercicses">
		<g:message code="exerciseType.exercicses.label" default="Exercicses" />
		
	</label>
	<g:select name="exercicses" from="${org.openexercise.Exercise.list()}" multiple="multiple" optionKey="id" size="5" value="${exerciseTypeInstance?.exercicses*.id}" class="many-to-many"/>
</div>

