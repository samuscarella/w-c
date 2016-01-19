# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# Default to JSON responses for remote calls
# $.ajaxSetup({
#   dataType: 'json'
# })
# # New Client
# $("#add_exercise").on("ajax:success", (e, data, status, xhr) ->
#   $("#exercise-append").append("<li>" + data['name'] + "</li>")
#   $("#exercise-append").effect("highlight")
# ).on("ajax:error", (e, data, status, xhr) ->
#   $("errors-box").html('exercise', data.responseJSON)
# )
# file: app/assets/javascripts/things.js.coffee

$(document).ready ->

  $(document).bind "ajaxSuccess", "form.exercise_form", (event, xhr, settings) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $("exercise-append").html(xhr.responseJSON.title + " saved.").appendTo $exercise_form
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $error_container.hide()

  $(document).bind "ajaxError", "form.exercise_form", (event, jqxhr, settings, exception) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul

  $(document).bind "ajaxSuccess", "form.tip_form", (event, xhr, settings) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $("exercise-append").html(xhr.responseJSON.title + " saved.").appendTo $exercise_form
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $error_container.hide()

  $(document).bind "ajaxError", "form.tip_form", (event, jqxhr, settings, exception) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul

  $(document).bind "ajaxSuccess", "form.tip_form_edit", (event, xhr, settings) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $("exercise-append").html(xhr.responseJSON.title + " saved.").appendTo $exercise_form
    if $("li", $error_container_ul).length
      $("li", $error_container_ul).remove()
    $error_container.hide()

  $(document).bind "ajaxError", "form.tip_form_edit", (event, jqxhr, settings, exception) ->
    $exercise_form = $(event.data)
    $error_container = $("#error_explanation", $exercise_form)
    $error_container_ul = $("ul", $error_container)
    $error_container.show()  if $error_container.is(":hidden")
    $.each jqxhr.responseJSON, (index, message) ->
      $("<li>").html(message).appendTo $error_container_ul
