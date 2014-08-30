$(document).ready ->
  tagsCount = $(".js-admin-tag").length

  $(".js-admin-tag-add").click ->
    $("#tags-list").append """
      <div class="mtxs">
        <input class="paxs bss bwas bc-4 full-width" id="category_tags_attributes_#{tagsCount}_name" name="category[tags_attributes][#{tagsCount}][name]" placeholder="Tag" type="text">
      </div>
    """
    tagsCount++

  $("body").on "click", ".js-admin-tag-remove", ->

  $("body").on "click", ".js-category-tag", ->
    $(@).toggleClass("active")
    tag_ids = []
    $(".js-category-tag.active").each ->
      tag_ids.push($(@).data("id"))
    window.location = "#{location.protocol}//#{location.host}#{location.pathname}?tag_ids=#{tag_ids.join(",")}"

