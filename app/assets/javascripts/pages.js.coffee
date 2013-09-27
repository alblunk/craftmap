# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("form#new_user")
    .on "ajax:send", (e) ->
      $(".form-group").removeClass("has-error")
      $("label[for='inputError']").empty()
      $(".form-group").removeClass("has-success")
      $("label[for='inputSuccess']").empty()

    .on "ajax:success", (e, data, status, xhr) ->
      $(".form-group").addClass("has-success")
      $("label[for='inputSuccess']").text xhr.responseJSON.message
      setTimeout ->
        $("#landing-joinus-modal").modal('hide')
      , 2000

    .on "ajax:error", (e, xhr, status, error) ->
      $(".form-group").addClass("has-error")
      $.each xhr.responseJSON.errors, (key, value) ->
        $("label[for='inputError']").text key + " " + value  