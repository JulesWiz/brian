$ ->

  $(".gridster ul").gridster
    widget_margins: [
      10
      10
    ]
    widget_base_dimensions: [
      310
      500
    ]
  # gridster = $(".gridster ul").gridster().data("gridster")
  # $("#draggable").draggable()
  # $(".gridster ").droppable drop: (event, ui) ->
  #   $("#draggable").removeAttr "style"
  #   gridster.add_widget "<li class=\"new\"><img src=\"http://www.sparity.com/images/facebookIcon.jpg\" alt=\"facebook\"  ></li>", 1, 1
  #   return

  # return



  # localData = JSON.parse(localStorage.getItem("positions"))
  # if localData?
  #   $.each localData, (i, value) ->
  #     id_name = undefined
  #     id_name = "#"
  #     id_name = id_name + value.id
  #     console.log id_name
  #     $(id_name).attr
  #       "data-col": value.col
  #       "data-row": value.row
  #       "data-sizex": value.size_x
  #       "data-sizey": value.size_y

  #     return

  # else
  #   console.log "No data returned by the server"

  # # widget_selector: "> ul"
  # # Define which elements are the widgets. Can be a CSS Selector string or a jQuery collection of HTMLElements.

  # # widget_margins: [3, 3]
  # # Horizontal and vertical margins respectively for widgets.

  # # widget_base_dimensions: [110, 110]
  # # Base widget dimensions in pixels. The first index is the width, the second is the height.

  # # serialize_params: function($w, wgd) { return { id: $($w).attr('id'),col: wgd.col, row: wgd.row,size_x: wgd.size_x,size_y: wgd.size_y }
  # # A function to return serialized data for each each widget, used when calling the serialize method. Two arguments are passed:
  # # $w: the jQuery wrapped HTMLElement which is used to get the id, and wgd: the grid coords object with keys col, row, size_x and size_y.

  # # draggable.stop: function(event, ui){} -- A callback for when dragging stops.
  # # You can also implement other draggable options based on your requirements
  # # draggable.start: function(event, ui){} -- A callback for when dragging starts.
  # # draggable.drag: function(event, ui){} -- A callback for when the mouse is moved during the dragging.

  # # .serialize( )
  # # Creates an array of objects representing the current position of all widgets in the grid.
  # # Returns an Array of Objects (ready to be encoded as a JSON string) with the data specified by the serialize_params option
  # # JSON.stringify() converts a primitive value, object or array to a JSON-formatted string that can later be parsed with JSON.parse().

  # # With HTML5, web pages can store data locally within the user's browser.
  # # Earlier, this was done with cookies. However, Web Storage is more secure and faster.
  # # The data is not included with every server request, but used ONLY when asked for.
  # # It is also possible to store large amounts of data, without affecting the website's performance.
  # # The data is stored in key/value pairs, and a web page can only access data stored by itself.

  # # this is where you can check if your data is sent to the server or not.
  # # A status of 200 implies success
  # # grid_canvas = $(".gridster > ul").gridster(
  # #   widget_margins: [
  # #     3
  # #     3
  # #   ]
  # #   widget_base_dimensions: [
  # #     110
  # #     110
  # #   ]
  #   serialize_params: ($w, wgd) ->
  #     id: $($w).attr("id")
  #     col: wgd.col
  #     row: wgd.row
  #     size_x: wgd.size_x
  #     size_y: wgd.size_y

  #   draggable:
  #     stop: (event, ui) ->
  #       positions = JSON.stringify(@serialize())
  #       localStorage.setItem "positions", positions
  #       $.post "process.php",
  #         positions: positions
  #       , (data) ->
  #         console.log data
  #         if data is 200
  #           console.log "Data successfully sent to the server"
  #         else
  #           console.log
  #         return

  #       return
  # ).data("gridster")
  # return
