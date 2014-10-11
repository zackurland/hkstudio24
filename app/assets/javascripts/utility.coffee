$(document).ready ->
  $("body").on "click", ".js-toggle", ->
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

  $(".js-sortable").sortable
    update: (event, ui) ->
      data = $(this).sortable('serialize')
      url = $(this).data("url")
      $.ajax
        data: data
        type: 'POST'
        url: url
  $(".js-sortable").disableSelection()
