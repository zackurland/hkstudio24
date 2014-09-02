$(window).load ->
  $(".js-masonry").each ->
    $(@).masonry
      itemSelector: '.js-masonry-item'
      transitionDuration: 0

  $('.js-lightbox').magnificPopup({type:'image'});
