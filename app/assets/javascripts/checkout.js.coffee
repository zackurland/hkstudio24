$(document).ready ->
  $(".js-checkout-filled-out-by-designer").change ->
    $(".js-checkout-your-information").toggleClass("hide")

  if $(".js-checkout-filled-out-by-designer").is(":checked")
    $(".js-checkout-your-information").addClass("hide")
