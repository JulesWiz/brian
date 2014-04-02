$ ->
  $("#btn-family").click ->
    # value = $(@).html()
    $(".Family").show()
    $(".Friends").hide()

  $("#btn-friends").click ->
    # value = $(@).html()
    $(".Friends").show()
    $(".Family").hide()

  $("#btn-all").click ->
    # value = $(@).html()
    $(".Friends").show()
    $(".Family").show()

  $("#form-btn").click ->
    $("#down").slideToggle(300)

  # $(".popover-markup>.trigger").popover
  # html: true
  # title: ->
  #   $(@).parent().find(".head").html()

  # content: ->
  #   $(@).parent().find(".content").html()

  $("#open").hide()

  $("#down").hide()


