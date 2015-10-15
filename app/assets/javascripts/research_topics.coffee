# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@researchTopicsReady = () ->
  $("[data-object~='research-topic-meter']").each ->
    # Set standard border radius for full width display
    if parseFloat($(this).data('progress')) > 95
      $(this).addClass 'border20'

    # Animate fill of progress bar
    $(this).width(0).animate {
      width: $(this).data('progress')+"%"
    }, 1000

    return
