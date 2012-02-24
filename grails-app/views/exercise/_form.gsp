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

<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="exercise.image.label" default="Image" />
		
	</label>
	<g:select id="image" name="image.id" from="${org.openexercise.Image.list()}" optionKey="id" value="${exerciseInstance?.image?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'thumbnail', 'error')} ">
	<label for="thumbnail">
		<g:message code="exercise.thumbnail.label" default="Thumbnail" />
		
	</label>
	<g:select id="thumbnail" name="thumbnail.id" from="${org.openexercise.Image.list()}" optionKey="id" value="${exerciseInstance?.thumbnail?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseInstance, field: 'exerciseType', 'error')} required">
	<label for="exerciseType">
		<g:message code="exercise.exerciseType.label" default="Exercise Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exerciseType" name="exerciseType.id" from="${org.openexercise.ExerciseType.list()}" optionKey="id" required="" value="${exerciseInstance?.exerciseType?.id}" class="many-to-one"/>
</div>

