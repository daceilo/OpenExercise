<%@ page import="org.openexercise.ExerciseBundle" %>



<div class="fieldcontain ${hasErrors(bean: exerciseBundleInstance, field: 'exercise', 'error')} required">
	<label for="exercise">
		<g:message code="exerciseBundle.exercise.label" default="Exercise" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exercise" name="exercise.id" from="${org.openexercise.Exercise.list()}" optionKey="id" required="" value="${exerciseBundleInstance?.exercise?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseBundleInstance, field: 'repetitions', 'error')} ">
	<label for="repetitions">
		<g:message code="exerciseBundle.repetitions.label" default="Repetitions" />
		
	</label>
	<g:field type="number" name="repetitions" value="${fieldValue(bean: exerciseBundleInstance, field: 'repetitions')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseBundleInstance, field: 'durationInSeconds', 'error')} ">
	<label for="durationInSeconds">
		<g:message code="exerciseBundle.durationInSeconds.label" default="Duration In Seconds" />
		
	</label>
	<g:field type="number" name="durationInSeconds" value="${fieldValue(bean: exerciseBundleInstance, field: 'durationInSeconds')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: exerciseBundleInstance, field: 'programDay', 'error')} required">
	<label for="programDay">
		<g:message code="exerciseBundle.programDay.label" default="Program Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="programDay" name="programDay.id" from="${org.openexercise.ProgramDay.list()}" optionKey="id" required="" value="${exerciseBundleInstance?.programDay?.id}" class="many-to-one"/>
</div>

