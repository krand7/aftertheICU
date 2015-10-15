@mainLoader = () ->
  $(document.links).filter(() ->
    return this.hostname != window.location.hostname
  ).attr('target', '_blank')

@loaders = () ->
  mainLoader()
  researchTopicsReady() if $("[data-object~='research-topic-meter']").length > 0

$(document).ready(loaders)
$(document)
  .on('page:load', loaders)


