calculateTotal = ->
  total = 0.0
  $(".js-admin-rental-item:visible").each ->
    total += parseFloat($(@).data("price"), 10)

  discountPercentage = parseInt($(".js-admin-rental-discount-percentage").val(), 10)
  if discountPercentage > 0
    discount = total * discountPercentage / 100
    total -= discount
    $(".js-admin-rental-discount").html("- $#{discount.toFixed(2)}")
    $(".js-admin-rental-discount-row").removeClass("hide")
  else
    $(".js-admin-rental-discount-row").addClass("hide")

  if $(".js-admin-rental-include-tax").is(":checked")
    taxPercentage = (parseFloat($(".js-admin-rental-tax-percentage").val(), 10) || 0) / 100
    tax = total * taxPercentage
    total += tax
    $(".js-admin-rental-tax").html("+ $#{tax.toFixed(2)}")
    $(".js-admin-rental-tax-row").removeClass("hide")
  else
    $(".js-admin-rental-tax-row").addClass("hide")

  $(".js-admin-rental-total").html("$#{total.toFixed(2)}")

$(document).ready ->
  $(".js-admin-rental-tax-percentage").keyup ->
    calculateTotal()

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
    calculateTotal()

  $(".js-admin-rental-include-tax").click ->
    calculateTotal()

  $(".js-admin-rental-discount-percentage").change ->
    calculateTotal()
