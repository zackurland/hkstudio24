$(document).ready ->
  tagsCount = $(".js-admin-tag").length

  $(".js-admin-tag-add").click ->
    $("#tags-list").append """
      <div class="row nmhxs mtxs">
        <div class="col-sm-3 phxs">
          <div class="pvxs">
            Tag Name
          </div>
        </div>
        <div class="col-sm-9 phxs">
          <input class="paxs bss bwas bc-4 full-width" id="category_tags_attributes_#{tagsCount}_name" name="category[tags_attributes][#{tagsCount}][name]" type="text">
        </div>
      </div>
    """
    tagsCount++

  $("body").on "click", ".js-admin-tag-remove", ->

  $("body").on "click", ".js-category-tag", ->
    $(@).toggleClass("active")
    categories = {}
    $(".js-category-tag.active").each ->
      category_id = $(@).data("category-id")
      unless categories[category_id]
        categories[category_id] = []
      categories[category_id].push($(@).data("id"))
    q = {}
    q["q"] = categories
    window.location = "#{location.protocol}//#{location.host}#{location.pathname}?#{$.param(q)}"

  $("body").on "click", ".js-product-tag", ->
    $("#tag-#{$(@).data("id")}").click()

