$(document).ready ->
  $(".js-infinite-scroll").each ->
    $(@).infinitescroll
      navSelector  : ".pagination"
      nextSelector : ".pagination a:last"
      itemSelector : ".js-product-display"
      bufferPx     : 800,
      donetext     : "",
    , (arrayOfNewElems) ->
      $html = $(arrayOfNewElems)
      $("#infscr-loading").remove()
      loadedImagesCount = 0
      $images = $html.find("img")
      if $images.length
        $images.each ->
          image = new Image()
          image.onload = ->
            loadedImagesCount++
            if loadedImagesCount == $images.length
              $(".js-masonry").masonry('appended', $html)
              $(".js-masonry").masonry()
          image.src = $(this).attr("src")
      $(arrayOfNewElems).each ->
        $(@).find('.js-lightbox').magnificPopup({type:'image'})
