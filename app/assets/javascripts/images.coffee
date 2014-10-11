$(window).load ->
  $(".js-masonry").each ->
    $masonry = $(@)
    $(@).masonry
      itemSelector: '.js-masonry-item'
      transitionDuration: 0
    $(@).masonry 'on', 'layoutComplete', ->
      $masonry.find(".js-masonry-item").fadeTo(400, 1)
    $(@).masonry("layout")

  $('.js-lightbox').magnificPopup({type:'image'});
