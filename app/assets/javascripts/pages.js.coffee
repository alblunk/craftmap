# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("form#new_user")
    .on "ajax:success", (e, data, status, xhr) ->
      console.log(xhr)
      $(".has-success label").append xhr.responseJSON.message
    .on "ajax:error", (e, xhr, status, error) ->
      $(".has-error label").append xhr.responseJSON.email[0]