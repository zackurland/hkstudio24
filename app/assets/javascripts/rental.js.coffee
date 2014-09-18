calculateTotal = ->
  total = 0.0
  $(".js-admin-rental-item").each ->
    total += parseFloat($(@).data("price"), 10)
  $(".js-admin-rental-total").html("$#{total.toFixed(2)}")

$(document).ready ->
  $(".js-admin-rental-item-price").keyup ->
    $item = $(@).closest(".js-admin-rental-item")
    dollars = parseFloat($(@).val().replace(/[^0-9a-zA-Z.]/g, ""), 10) || 0
    $item.data("price", dollars)
    calculateTotal()

  $(".js-admin-rental-item-remove").click ->
    $item = $(@).closest(".js-admin-rental-item")
    index = $(".js-admin-rental-item").index($item)
    $item.append("""<input id="rental_items_attributes_#{index}__destroy" name="rental[items_attributes][#{index}][_destroy]" type="hidden" value="1">""")
    $item.hide()

