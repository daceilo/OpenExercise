<%@ page import="org.openexercise.Exercise" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'exercise.label', default: 'Exercise')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>

    <style>

    #effect {
        width: 515px;
        height: 260px;
        padding: 0.4em;
        float: left;
        background: #fff;
        margin-bottom: 10px;
        margin-left: 10px;
    }

    #picture {
        width: 100px;
        height: 100px;
        float: left;
        margin-right: 10px;
        margin-bottom: 10px;
        background: #f3f3ff;
    }

    #description {
        width: 400px;
        height: 100px;
        float: left;
        margin-bottom: 10px;
        background: #f3f3ff;
    }

    #instructions {
        width: 512px;
        height: 100px;
        float: left;
        background: #f3f3ff;
    }

    #effect h3 {
        margin: 0;
        margin-bottom: 10px;
        padding: 0.4em;
        text-align: center;
    }
    </style>

</head>

<body>
<a href="#list-exercise" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-exercise" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
</div>

<g:each in="${exerciseInstanceList}" status="i" var="exerciseInstance">
    <div id="effect" class="ui-widget-content ui-corner-all">
        <h3 class="ui-widget-header ui-corner-all"><g:link action="show"
                                                           id="${exerciseInstance.id}">${fieldValue(bean: exerciseInstance, field: "name")}</g:link></h3>

        <div id="picture" class="ui-widget-content ui-corner-all">
            Picture
        </div>

        <div id="description" class="ui-widget-content ui-corner-all">
            ${fieldValue(bean: exerciseInstance, field: "description")}
        </div>

        <div id="instructions" class="ui-widget-content ui-corner-all">
            ${fieldValue(bean: exerciseInstance, field: "instructions") ? fieldValue(bean: exerciseInstance, field:
                    "instructions"): "None entered"}
        </div>
    </div>
</g:each>

</body>
</html>
