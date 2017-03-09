# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cropPicture = ->
  $("#cropbox").Jcrop(
    onChange: updateCrop,
    onSelect: updateCrop,
    setSelect: [0, 0, 500, 500],
    aspectRatio: 1
  )

updateCrop = (coords) ->
  rx = 100/coords.w
  ry = 100/coords.h
  avatarWidth = parseInt(document.getElementById('avatar_width').value)
  avatarHeight = parseInt(document.getElementById('avatar_height').value)
  $('#preview').css
    width: Math.round(rx * avatarWidth) + 'px'
    height: Math.round(ry * avatarHeight) + 'px'
    marginLeft: '-' + Math.round(rx * coords.x) + 'px'
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  $('#crop_x').val(coords.x)
  $('#crop_y').val(coords.y)
  $('#crop_w').val(coords.w)
  $('#crop_h').val(coords.h)
  true

$(document).on("turbolinks:load", cropPicture)
