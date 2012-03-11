/**
 * Created by IntelliJ IDEA.
 * User: laurence
 * Date: 12-02-27
 * Time: 10:42 AM
 * To change this template use File | Settings | File Templates.
 */

$(function () {
    var $exercises = $(".draggable");
    var trash_icon = '<a id="trash" href="#" title="Remove from program" class="ui-icon ui-icon-trash">Remove</a>';
    var inputs = '<input id="repetitions-temp" class="ui-widget-content ui-corner-all" type=text value="Number of reps" />' +
            '<input id="durationInSeconds-temp" class="ui-widget-content ui-corner-all" type=text value="Duration in seconds" />'

    $(document).ready(function () {
        addClickable();
    });

    $("#accordion").accordion({
        collapsible:true,
        active:false,
        autoHeight:false
    });


    $("#program").tabs();

    $(".can-drop").droppable({
        accept:".exercises > li",
        tolerance:'touch',
        drop:function (event, ui) {


            var $list = $("ul", $(this)).length ? $("ul", $(this)) : $("<ul class='exercises ui-helper-reset'/>").appendTo($(this)), $newDraggable = ui.draggable.clone();

            $newDraggable.removeClass("ui-draggable");
            $newDraggable.addClass("exercise-entry");
            $newDraggable.append(trash_icon).append(inputs).appendTo($list);

            var $idArray = this.id.split("-", 2);
            addToProgramDay($idArray[1], $idArray[0], ui.draggable.attr('id'), $newDraggable);
        }
    });

    $("button").click(function () {
        alert("Going to call AJAX");
        createNewProgram();
    });

    $("li", $exercises).draggable({
        revert:'invalid',
        helper:'clone',
        appendTo:'body'
    });

    $("input", ".exercise-entry").change(function() {
        updateExerciseBundle(this.id, this.value)
    });

    function addClickable() {
        $("a.ui-icon-trash").unbind('click.addit').bind('click.addit', function (event) {
            var $item = $(this).parent();

            deleteExerciseBundle($item);

        });
    }

    function deleteExerciseBundle(id) {
        $.ajax({
            url:appContext + "/exerciseBundle/delete",
            type:"POST",
            dataType:"text",
            data:"id=" + id.attr('id').split("-", 2)[1],
            cache:false,
            async:true,
            error:function (xhr, ajaxOptions, thrownError) {
                window.location.replace(appContext + "/login")
            },
            success:function (result) {
                $("#" + id.attr('id')).remove();
            }
        });
    }

    function addToProgramDay(program, day, toAdd, toUpdate) {
        $.ajax({
            url:appContext + "/exerciseBundle/createFromExercise",
            type:"POST",
            dataType:"text",
            data:"program.id=" + program + "&programDay.id=" + day + "&exercise.id=" + toAdd,
            cache:false,
            async:true,
            error:function (xhr, ajaxOptions, thrownError) {
                window.location.replace(appContext + "/login")
            },
            success:function (result) {
                /* need to update repetitions-temp and durationInSeconds-temp with appropriate ID */
                toUpdate.attr('id', "exercisebundle-" + result);
                toUpdate.find( "#repetitions-temp" ).attr('id', "repetitions-" + result);
                toUpdate.find( "#durationInSeconds-temp" ).attr('id', "durationInSeconds-" + result);
                addClickable();
            }
        });
    }

    function createNewProgram() {
        alert("About to call AJAX at " + appContext + "/program/ajaxCreateProgram");
        $.ajax({
            url:appContext + "/program/ajaxCreateProgram",
            type:"POST",
            cache:false,
            async:false,
            error:function (xhr, ajaxOptions, thrownError) {
                window.location.replace(appContext + "/login")
            },
            success:function (result) {
                alert("Created program");
                window.location.replace(appContext + "/program/edit/" + result);
            }
        });
    }

    function updateExerciseBundle(id, value) {
        /* 0 = what to update, 1 = ID of exercise bundle to update*/
        var $idArray = id.split("-", 2);

        /* alert("About to update " + $idArray[0] + " in exercise bundle " + $idArray[1] + " to value " + value); */
        $.ajax({
            url:appContext + "/exerciseBundle/update",
            type:"POST",
            dataType:"text",
            data:"id=" + $idArray[1] + "&" + $idArray[0] + "=" + value,
            cache:false,
            async:false,
            error:function (xhr, ajaxOptions, thrownError) {
                window.location.replace(appContext + "/login")
            },
            success:function (result) {
                /* alert("Updated object"); */
            }
        });
    }
});