<%@ page import="org.openexercise.ExerciseType; org.openexercise.Exercise" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'exercise.label', default: 'Exercise')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <r:require module="core"/>

    <!-- Specific style just for the accordion -->
    <style>
    #accordion {
        width: 600px;
        padding: 0.4em;
        float: left;
        background: #fff;
        margin-bottom: 10px;
        margin-left: 10px;
    }
    </style>

</head>

<body>

<!-- jQuery stuff here -->
<script>
    $(function () {
        $("#accordion").accordion({
            collapsible:true,
            active:false,
            event:"mouseover",
            autoHeight:false,
            navigation:true
        });
    });
</script>
<!-- End jQuery stuff -->

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

<div id="accordion">
    <g:each in="${ExerciseType.list()}" status="c" var="exerciseTypeInstance">
        <h3><a href="#">${fieldValue(bean: exerciseTypeInstance, field: "name")}</a></h3>

        <div>
            <g:each in="${Exercise.findAllByExerciseType(exerciseTypeInstance)}" status="i" var="exerciseInstance">
                <div id="smalleffect" class="ui-widget-content ui-corner-all">
                    <div id="picture" class="ui-widget-content ui-corner-all">
                        <g:link action="show"
                                id="${exerciseInstance.id}">Picture</g:link>
                    </div>

                    <div id="smallname" class="ui-widget-content ui-corner-all">
                        ${fieldValue(bean: exerciseInstance, field: "name")}
                    </div>
                </div>
            </g:each>
        </div>
    </g:each>
</div>


<!-- TO BE USED IN SHOW
    <div id="effect" class="ui-widget-content ui-corner-all">
        <h3 class="ui-widget-header ui-corner-all">Name</h3>

        <div id="picture" class="ui-widget-content ui-corner-all">
            Picture
        </div>

        <div id="description" class="ui-widget-content ui-corner-all">
            Description
        </div>

        <div id="instructions" class="ui-widget-content ui-corner-all">
            Instructions
        </div>
    </div>
-->
</body>
</html>
