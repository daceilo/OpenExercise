<%@ page import="org.openexercise.ExerciseType; org.openexercise.Exercise; org.apache.commons.lang.WordUtils; org.openexercise.Program" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'program.label', default: 'Program')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <r:require module="core"/>

</head>

<body>
<a href="#show-program" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

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
            <div id="${it}-drop" class="ui-widget-content ui-corner-all can-drop program-tab">
                <ul id="exercises-${it}" class="exercises ui-helper-reset ui-helper-clearfix">

                    <g:each in="${programInstance."${it}".exerciseBundles}" status="i" var="exerciseBundleInstance">
                        <li class="ui-widget-content ui-corner-all exercise-entry">
                            <g:link action="show" controller="exercise"
                                    id="${exerciseBundleInstance.exercise.id}"><img class="Photo"
                                                                                    src="${createLink(controller: 'image',
                                                                                            action: 'displayImage', id: exerciseBundleInstance.exercise.thumbnail?.id)}"/></g:link>
                            <h4 class="ui-widget-content ui-corner-all">
                                ${fieldValue(bean: exerciseBundleInstance.exercise, field: "name")}
                            </h4>

                        </li>
                    </g:each>

                </ul>
            </div>
        </div>
    </g:each>
</div>

<g:form style="clear: both;">
    <fieldset class="buttons">
        <g:hiddenField name="id" value="${programInstance?.id}"/>
        <g:link class="edit" action="edit" id="${programInstance?.id}"><g:message code="default.button.edit.label"
                                                                                  default="Edit"/></g:link>
        <g:actionSubmit class="delete" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
</g:form>

</body>
</html>
