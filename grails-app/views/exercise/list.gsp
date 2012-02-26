<%@ page import="org.apache.commons.lang.WordUtils; org.openexercise.ExerciseType; org.openexercise.Exercise" %>
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
        width: 400px;
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
        var $exercises = $( ".exercises" );

        $("#accordion").accordion({
            collapsible:true,
            active:false,
            autoHeight:false
        });

        $( "li", $exercises ).draggable({
            revert:'invalid',
            helper:'clone',
            appendTo:'body'
        });

        $("input:submit", ".buttonrow").button();

        $("#program").tabs();

        $(".can-drop").droppable({
            accept: ".exercises > li",
            tolerance:'touch',
            drop:function (event, ui) {


                var $list = $("ul", $(this)).length ? $("ul", $(this)) :
                        $("<ul class='exercises ui-helper-reset'/>").appendTo($(this)),
                        $newDraggable = ui.draggable.clone();


                ui.draggable.appendTo( $list );


            }
        });

        function updateItem( $item, $to ) {
            $item.fadeOut(function() {
                var $list = $( "ul", $to ).length ?
                        $( "ul", $to ) :
                        $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $to );

                $item.appendTo( $list )
            });
        }

        function snapDropped(droppedOn, droppedElement) {
            alert("Dropped " + droppedElement.id + " on " + droppedOn.id);
            $droppedElement.find("#buttonrow").remove();

            var $list = $("ul", $droppedOn).length ? $("ul", $droppedOn) : $("<ul class='exercises ui-helper-reset'/>").appendTo($droppedOn);
            $droppedElement.appendTo($list);

        }
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

<!-- This is where we will put all the exercises for the programs, organized by exercise type -->
<div id="container">
    <div id="accordion">
        <g:each in="${ExerciseType.list()}" status="c" var="exerciseTypeInstance">
            <h3><a href="#">${fieldValue(bean: exerciseTypeInstance, field: "name")}</a></h3>

            <div>
                <!-- TODO replace DIV with UL -->
                <ul id="exercises-${exerciseTypeInstance.id}" class="exercises ui-helper-reset ui-helper-clearfix">
                    <g:each in="${Exercise.findAllByExerciseType(exerciseTypeInstance)}" status="i"
                            var="exerciseInstance">
                        <li class="ui-widget-content ui-corner-all exercise-entry">
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

    <!-- Build out Program where exercises can be dropped. Rather than doing this by hand, we will iterate over the days
     of the week -->
    <g:set var="daysOfWeek" scope="page"
           value="${['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']}"/>
    <div id="program">
        <ul>
            <g:each in="${daysOfWeek}">
                <li><a href="#${it}">${WordUtils.capitalizeFully(it)}</a></li>
            </g:each>
        </ul>

        <g:each in="${daysOfWeek}">
            <div id="${it}">
                <div id="${it}-drop" class="ui-widget-content ui-corner-all can-drop program-tab">

                </div>
            </div>
        </g:each>
    </div>
</div>


<!-- TO BE USED IN SHOW

-->
</body>
</html>
