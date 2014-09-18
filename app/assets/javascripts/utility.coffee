$(document).ready ->
  $(".js-toggle").click ->
    $(@).toggleClass("active")
    $target = $($(@).data("toggle-target"))
    className = $(@).data("toggle-class")
    $target.toggleClass(className)

  $(".js-datepicker").each ->
    $(this).datepicker
      minDate: 1,
      altFormat: "yy/mm/dd",
      dateFormat: "mm/dd/yy",
      altField: $(this).next()

  $('.js-phone-number').formatter
    'pattern': '({{999}}) {{999}} {{9999}}'
