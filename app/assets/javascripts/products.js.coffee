$(document).ready ->
  $("body").on "click", ".js-admin-product-remove", ->
    $(@).closest(".js-admin-product").remove()
