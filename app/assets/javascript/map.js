$(function(){
  $(function() {
    $("#map").googleMap({
      zoom: 15, // Initial zoom level (optional)
      coords: [35.681382, 139.766084], // Map center (optional)
      type: "ROADMAP" // Map type (optional)
    });
  })
});