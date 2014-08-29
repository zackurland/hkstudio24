$(document).ready ->
  $(".js-toggle").click ->
    $target = $($(@).data("toggle-target"))
    className = $(@).data("toggle-class")
    $target.toggleClass(className)
