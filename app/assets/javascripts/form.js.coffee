$ ->
  $("#btn-family").click ->
    # value = $(@).html()
    $(".Family").show()
    $(".Friends").hide()

  $("#btn-friends").click ->
    # value = $(@).html()
    $(".Friends").show()
    $(".Family").hide()

  $("#startbtn").click ->
    $("#open").slideToggle(300)

