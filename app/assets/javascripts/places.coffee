# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  # if the element with clss "places show" is on page, display the google maps
  # "places show" are classes generated from controller and action
  if $('.places.show').length > 0
    initialize = ->
      my_center =
        lat: $('#map-canvas').data('lat')
        lng: $('#map-canvas').data('lng')
      mapOptions =
        center: my_center,
        zoom: 8
      map = new (google.maps.Map)(document.getElementById('map-canvas'), mapOptions)
      marker = new google.maps.Marker(position: my_center, map: map)
    google.maps.event.addDomListener window, 'load', initialize
