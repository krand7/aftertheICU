@socialMediaReady = () ->

  # Wraptext tutorial thanks to http://www.html5canvastutorials.com/tutorials/html5-canvas-wrap-text-tutorial/
  wrapText = (context, text, x, y, maxWidth, lineHeight) ->
    words = text.split(' ')
    line = ''
    n = 0
    while n < words.length
      testLine = line + words[n] + ' '
      metrics = context.measureText(testLine)
      testWidth = metrics.width
      if testWidth > maxWidth and n > 0
        context.fillText line, x, y
        line = words[n] + ' '
        y += lineHeight
      else
        line = testLine
      n++
    context.fillText line, x, y
    return

  drawCanvas = (canvasTitle, canvasText) ->
    c = document.getElementById('socialMediaCanvas')
    ctx = c.getContext('2d')

    # Layout
    ctx.fillStyle = '#39c1c7'
    ctx.fillRect 0, 0, 300, 800
    ctx.fillStyle = '#333'
    ctx.fillRect 300, 0, 500, 800
    ctx.fillStyle = '#fff'
    ctx.fillRect 295, 0, 10, 800

    # Title
    img = document.getElementById('logo')
    ctx.drawImage img, 0, 200

    # ctx.font = "25px 'Open Sans'"
    # ctx.fillStyle = '#d35270'
    # ctx.fillText 'aftertheicu.org', 100, 775

    # Content
    ctx.font = "40px 'Open Sans'"
    ctx.fillStyle = '#fff'
    wrapText(ctx, canvasText, 320, 150, 460, 60)


  contentText = $('#social_media_text').val()
  drawCanvas('After the ICU', contentText)


  $(document)
    .on('input', '#social_media_text', () ->
      contentText = $(this).val()
      drawCanvas('After the ICU', contentText)
    )
