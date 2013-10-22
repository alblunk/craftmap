# Displays thumbnail images when clicked.
$(".p-thumbnails").on "click", (e) ->
  $("#product-image").attr "src", $(e.target).attr("src")
