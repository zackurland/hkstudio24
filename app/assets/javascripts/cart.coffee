$(document).ready ->
  $(".js-cart-item-add").click ->
    $product = $(@).closest(".js-product-display")

    if $product.hasClass("active")
      $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) - 1)
      $.ajax
        type: "post"
        url: "/cart/items/remove"
        data:
          _method: "delete"
          item:
            product_id: $product.data("id")
      .success ->
        console.log("remove hurrah")
      .error ->
        $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) + 1)
        console.log("remove unhurrah")
    else
      $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) + 1)
      $.ajax
        type: "post"
        url: "/cart/items/add"
        data:
          item:
            product_id: $product.data("id")
      .success ->
        console.log("add hurrah")
      .error ->
        $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) - 1)
        console.log("add unhurrah")

  $(".js-cart-item-remove").click ->
    $item = $(@).closest(".js-cart-item")
    $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) - 1)
    $.ajax
      type: "post"
      url: "/cart/items/remove"
      data:
        _method: "delete"
        item:
          product_id: $item.data("product-id")
    .success ->
      $item.animate {opacity: 0.01}, 400, ->
        $item.animate {height: "0px"}, 400, ->
          $item.remove()
    .error ->
      $(".js-cart-items-count").html(parseInt($(".js-cart-items-count").html(), 10) + 1)
      console.log("remove unhurrah")

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
