$(document).ready ->
  $("body").on "click", ".js-cart-item-add", ->
    $product = $(@).closest(".js-product-display")

    if $product.data("in-cart") == true
      $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) - 1)
      $.ajax
        type: "post"
        url: "/cart/items/remove"
        data:
          _method: "delete"
          item:
            product_id: $product.data("id")
      .error ->
        $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) + 1)
      .complete ->
        $product.data("in-cart", false)
    else
      $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) + 1)
      $.ajax
        type: "post"
        url: "/cart/items/add"
        data:
          item:
            product_id: $product.data("id")
      .error ->
        $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) - 1)
      .complete ->
        $product.data("in-cart", true)

  $(".js-cart-rental-date-form-input").change ->
    $(@).closest(".js-cart-rental-date-form").submit()

  $(".js-cart-rental-date-form").on "ajax:success", (event, data, status, xhr) =>
    console.log("success")

  $(".js-cart-rental-date-form").on "ajax:error", (event, xhr, status, error) =>

  $(".js-cart-checkout").click (e) ->
    $link = $(@)
    $(".js-cart-item").removeClass("active")
    $("#cart-error").addClass("hide")
    e.preventDefault()
    $.ajax
      type: "GET"
      url: "/cart/check_availabilities"
    .success (data) ->
      unavailable = false
      for item in data.items
        if !item.available
          unavailable = true
          $("#cart-item-#{item.id}").addClass("active")
      if unavailable
        $("#cart-error").removeClass("hide")
      else
        window.location = $link.attr("href")
