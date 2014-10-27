$(document).ready ->
  $(".js-country-select-with-state").change ->
    $countrySelect = $(@)
    $.ajax
      url: "/countries/#{$countrySelect.val()}/states"
    .success (data) ->
      $stateSelect = $($countrySelect.data("states-target"))
      $stateSelect.html("")
      for state in data.states
        $stateSelect.append("<option value=\"#{state}\">#{state}</option>")
      $stateSelect.closest(".js-state-wrapper").removeClass("hide")
      $stateSelect.change()
