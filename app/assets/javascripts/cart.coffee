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
