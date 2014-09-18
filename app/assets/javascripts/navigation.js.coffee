$(document).ready ->
  $(".js-navigation-toggle").click ->
    $navigation = $("#navigation")
    $content = $("#content")
    $mobile = $("#mobile-navigation")
    if !$navigation.hasClass("open")
      $navigation.animate({left: "0%"}, 300)
      $content.css({position: "fixed", left: "0%", right: "auto", width: "100%", top: -$(window).scrollTop()}).animate({left: "80%"}, 300)
      $mobile.animate({left: "80%"}, 300)
    else
      $navigation.animate {left: "-80%"}, 300
      $content.animate {left: "0%"}, 300, ->
        $content.css({position: "static"})
        console.log($content.css("top"))
        $(document).scrollTop(-parseInt($content.css("top").replace("px", ""), 10))
      $mobile.animate({left: "0%"}, 300)
    $navigation.toggleClass("open")
    $(@).toggleClass("active")
