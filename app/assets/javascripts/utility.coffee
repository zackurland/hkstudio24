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
      index = 1
      for sorted in $(this).sortable('toArray')
        $("##{sorted}").find(".js-sortable-index").html(index++)
      data = $(this).sortable('serialize')
      url = $(this).data("url")
      $.ajax
        data: data
        type: 'POST'
        url: url
  $(".js-sortable").disableSelection()

  $(".js-scroll-with-screen").each ->
    $el = $(@)
    placeholderId = "#{$el.attr("id")}-placeholder"

    calculateScrollableSpace = ->
      $content = $el.find(".js-scroll-with-screen-content")
      if $content.length
        $header = $el.find(".js-scroll-with-screen-header")
        $footer = $el.find(".js-scroll-with-screen-footer")
        $start = $($el.data("scroll-start-target"))
        maxHeight = $(window).height()

        if $header.length
          maxHeight -= $header.outerHeight()
        if $footer.length
          maxHeight -= $footer.outerHeight()
        if $start.length
          maxHeight -= $start.outerHeight()

        $content.css
          maxHeight: "#{maxHeight - parseInt($el.css("paddingTop"), 10) - parseInt($el.css("paddingBottom"))}px"

    resetScrollableSpace = ->
      $content = $el.find(".js-scroll-with-screen-content")
      $content.css
        maxHeight: "none"

    scrollHandler = ->
      $placeholder = $("##{placeholderId}")
      topOffset = 0
      bottomOffset = 0
      fixLimit = 0
      if $el.data("scroll-start-target")?
        topOffset += $($el.data("scroll-start-target")).outerHeight()
      if $el.data("scroll-stop-target")?
        bottomOffset += $($el.data("scroll-stop-target")).outerHeight()
      if $el.data("fix-limit-px")?
        fixLimit = parseInt($el.data("fix-limit-px"), 10)
      if ($(window).width() >= fixLimit) && (($placeholder.length && $(@).scrollTop() + topOffset > $placeholder.offset().top) || (!$placeholder.length && $(@).scrollTop() + topOffset > $el.offset().top))
        if !$placeholder.length
          $placeholder = $el.after("""<div id="#{placeholderId}">""")
        $el.css
          top: "#{Math.min($(document).height() - $(@).scrollTop() - $el.outerHeight() - bottomOffset, topOffset)}px"
          left: "#{$placeholder.offset().left}px"
          width: "#{$placeholder.outerWidth()}px"
        $el.addClass("fixed")
        calculateScrollableSpace()
      else if $placeholder.length && $(@).scrollTop() < $placeholder.offset().top
        $placeholder.remove()
        $el.css
          width: "auto"
        $el.removeClass("fixed")
        resetScrollableSpace()

    $(window).scroll ->
      scrollHandler()

    $(window).resize ->
      scrollHandler()

    $(window).scroll()
