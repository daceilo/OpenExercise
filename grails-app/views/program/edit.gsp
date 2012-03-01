<%@ page import="org.openexercise.Exercise; org.openexercise.ExerciseType; org.apache.commons.lang.WordUtils; org.openexercise.Program" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <r:require module="core"/>

</head>

<body>
<a href="#edit-program" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>


<div id="edit-program" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div id="error-message" class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${programInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${programInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div id="accordion">
        <g:each in="${ExerciseType.list()}" status="c" var="exerciseTypeInstance">
            <h3><a href="#">${fieldValue(bean: exerciseTypeInstance, field: "name")}</a></h3>

            <div>
                <ul id="exercisetype-${exerciseTypeInstance.id}"
                    class="exercises draggable ui-helper-reset ui-helper-clearfix">
                    <g:each in="${Exercise.findAllByExerciseType(exerciseTypeInstance)}" status="i"
                            var="exerciseInstance">
                        <li id="${exerciseInstance.id}"
                            class="ui-widget-content ui-corner-all exercise-entry">
                            <g:link action="show"
                                    id="${exerciseInstance.id}"><img class="Photo"
                                                                     src="${createLink(controller: 'image',
                                                                             action: 'displayImage', id: exerciseInstance.thumbnail?.id)}"/></g:link>
                            <h4 class="ui-widget-content ui-corner-all">
                                ${fieldValue(bean: exerciseInstance, field: "name")}
                            </h4>
                        </li>
                    </g:each>
                </ul>
            </div>
        </g:each>
    </div>

    <g:set var="week" scope="page"
           value="${['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']}"/>
    <div id="program">
        <ul>
            <g:each in="${week}" status="c" var="day">
                <li><a href="#${day}">${WordUtils.capitalizeFully(day)}</a></li>
            </g:each>
        </ul>

        <g:each in="${week}">
            <div id="${it}">
                <div id="${programInstance."${it}".id}-${programInstance.id}"
                     class="ui-widget-content ui-corner-all can-drop program-tab">
                    <ul id="exercises-${it}" class="exercises ui-helper-reset ui-helper-clearfix">

                        <g:each in="${programInstance."${it}".exerciseBundles}" status="i" var="exerciseBundleInstance">
                            <li id="exercisebundle-${exerciseBundleInstance.id}"
                                class="ui-widget-content ui-corner-all exercise-entry">
                                <g:link action="show"
                                        id="${exerciseBundleInstance.exercise.id}"><img class="Photo"
                                                                                        src="${createLink(controller: 'image',
                                                                                                action: 'displayImage', id: exerciseBundleInstance.exercise.thumbnail?.id)}"/></g:link>
                                <h4 class="ui-widget-content ui-corner-all">
                                    ${fieldValue(bean: exerciseBundleInstance.exercise, field: "name")}
                                </h4>
                                <g:link controller="exerciseBundle" action="delete"
                                        id="${exerciseBundleInstance.id}" title='Remove from program' class='ui-icon ui-icon-trash'>Remove</g:link>
                            </li>
                        </g:each>

                    </ul>
                </div>
            </div>
        </g:each>
    </div>

    <g:form method="post" style="clear: both;">
        <g:hiddenField name="id" value="${programInstance?.id}"/>
        <g:hiddenField name="version" value="${programInstance?.version}"/>

        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate=""
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>