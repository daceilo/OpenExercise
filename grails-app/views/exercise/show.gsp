<%@ page import="org.openexercise.Exercise" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'exercise.label', default: 'Exercise')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <r:require module="core"/>

</head>

<body>
<a href="#show-exercise" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-exercise" class="content scaffold-show" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${exerciseInstance?.name}">
        <div id="effect" class="ui-widget-content ui-corner-all">
            <h3 class="ui-widget-header ui-corner-all">${fieldValue(bean: exerciseInstance, field: "name")}</h3>

            <div id="picture" class="ui-widget-content ui-corner-all">
                <g:link controller="image" action="displayImage" id="${exerciseInstance.image?.id}"><img class="Photo"
                                                                                                         src="${createLink(controller: 'image', action: 'displayImage', id: exerciseInstance?.thumbnail?.id)}"/></g:link>
            </div>

            <div id="description" class="ui-widget-content ui-corner-all">
                ${fieldValue(bean: exerciseInstance, field: "description")}
            </div>

            <div id="instructions" class="ui-widget-content ui-corner-all">
                <p>${fieldValue(bean: exerciseInstance, field: "instructions")}</p>
                <p>&nbsp;</p>
                <p><b>${fieldValue(bean: exerciseInstance, field: "exerciseType")}</b></p>
            </div>
        </div>
    </g:if>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${exerciseInstance?.id}"/>
            <g:link class="edit" action="edit" id="${exerciseInstance?.id}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>

</body>
</html>
