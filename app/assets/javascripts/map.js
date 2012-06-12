$(function(){
  $('#map_canvas').gmap().bind('init', function(ev, map) {
    $.each(checkins,function(index,checkin){

      var marker_description = checkin.checkin_name + " <br/><B>" + checkin.tags + "</B>";

      $('#map_canvas').gmap('addMarker', {
        'id': 1, 'tags':'some test tag', 'position': new google.maps.LatLng(checkin.lat, checkin.lng), 'bounds':true }).click(function() {
          $('#map_canvas').gmap('openInfoWindow', { 'content': marker_description }, this);
      });
    });
  });
});
