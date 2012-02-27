/**
 * Created by IntelliJ IDEA.
 * User: laurence
 * Date: 12-02-27
 * Time: 10:42 AM
 * To change this template use File | Settings | File Templates.
 */

$(function () {
    var $exercises = $(".draggable");
    var trash_icon =
            "<a href='link/to/trash/script/when/we/have/js/off' title='Remove from program' class='ui-icon ui-icon-trash'>Remove</a>";

    $("#accordion").accordion({
        collapsible:true,
        active:false,
        autoHeight:false
    });

    $("li", $exercises).draggable({
        revert:'invalid',
        helper:'clone',
        appendTo:'body'
    });

    $("#program").tabs();

    $(".can-drop").droppable({
        accept:".exercises > li",
        tolerance:'touch',
        drop:function (event, ui) {


            var $list = $("ul", $(this)).length ?
                    $("ul", $(this)) :
                    $("<ul class='exercises ui-helper-reset'/>").appendTo($(this)),
                    $newDraggable = ui.draggable.clone();

            $newDraggable.append(trash_icon).appendTo($list);

        }
    });

    $("button").click(function () {
        $("div:hidden").show("fast");
        $("#new-program").hide("fast");
    });

});