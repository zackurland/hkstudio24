$(window).load ->
  $(".js-masonry").each ->
    $(@).masonry
      itemSelector: '.js-masonry-item'

  $('.js-lightbox').magnificPopup({type:'image'});
