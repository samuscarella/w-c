# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#exercise_form_edit').submit (e) ->
    # e.preventDefault();
    exercise.name = $('#exercise-name').val()
    exercise.difficulty = $('#exercise-difficulty').val()
    exercise.user_id = $('#exercise-user_id').val()
    exercise.description = $('#exercise-description').val()
    exercise.equipment = $('#exercise-equipment').val()
    exercise.sets = $('#exercise-sets').val()
    exercise.reps = $('#exercise-reps').val()
    exercise.workout_id = $('#exercise-workout_id').val()
    exercise.serializeArray()
    $.ajax
      url: 'create_exercise'
      type: 'POST'
      data: exercise
      dataType: 'json'
      success: (data, status, xhr) ->
        console.log 'begin'
        console.log data
        console.log status
        console.log xhr
        console.log 'success'
        false
      error: (data) ->
        false
    return
  return
