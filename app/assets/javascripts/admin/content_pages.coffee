# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document)
  .on('input', '[data-object~="page-content-input"]', () ->
    $.post(root_url + 'admin/content_groups/' + $(this).data('groupid') + '/content_pages/' + $(this).data('pageid') + '/preview', $("#admin_content_page_content").serialize() + "&content_page_id=" + $(this).data('pageid'), null, "script")
  )
