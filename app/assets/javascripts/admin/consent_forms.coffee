# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document)
  .on('input', '[data-object~="consent-content-input"]', () ->
    $.post(root_url + 'admin/consent_forms/' + $(this).data('formid') + '/preview', $("#admin_consent_form_content").serialize() + "&consent_form_id=" + $(this).data('formid'), null, "script")
  )
