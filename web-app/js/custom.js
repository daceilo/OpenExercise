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
            $newDraggable.append(trash_icon).appendTo($list);

            var $idArray = this.id.split("-", 2)
            addToProgramDay($idArray[1], $idArray[0], ui.draggable.attr('id'), $newDraggable);
        }
    });

    $("button").click(function () {
        $("div:hidden").show("fast");
        $("#new-program").hide("fast");
    });

    $("li", $exercises).draggable({
        revert:'invalid',
        helper:'clone',
        appendTo:'body'
    });

    function addClickable() {
        $("a.ui-icon-trash").unbind('click.addit').bind('click.addit', function (event) {
                    var $item = $(this).parent();

                    deleteExerciseBundle($item);

                });
    }

    function deleteExerciseBundle(id) {
        $.ajax({
            url:"/OpenExercise/exerciseBundle/delete",
            type:"POST",
            dataType:"text",
            data:"id=" + id.attr('id').split("-", 2)[1],
            cache:false,
            async:true,
            success:function (result) {
                $("#" + id.attr('id')).remove();
            }
        });
    }

    function addToProgramDay(program, day, toAdd, toUpdate) {
        $.ajax({
            url:"/OpenExercise/exerciseBundle/createFromExercise",
            type:"POST",
            dataType:"text",
            data:"program.id=" + program + "&programDay.id=" + day + "&exercise.id=" + toAdd,
            cache:false,
            async:true,
            success:function (result) {
                toUpdate.attr('id', "exercisebundle-" + result);
                addClickable();
            }
        });
    }
});