# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document)
  .on('click', '[data-object~="preview-post"]', () ->
    $.post(root_url + 'forums/' + $(this).data('forum-id') + '/topics/' + $(this).data('topic-id') + '/posts/preview', $("#post_description").serialize() + "&post_id=" + $(this).data('post-id'), null, "script")
  )
  .on('click', '[data-object~="toggle-post"]', () ->
    $("#post_contents_#{$(this).data('post-id')}").toggle()
    false
  )
