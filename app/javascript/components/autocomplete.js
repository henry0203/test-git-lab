function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var lamaAddress = document.getElementById('lama_address');

    if (lamaAddress) {
      var autocomplete = new google.maps.places.Autocomplete(lamaAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(lamaAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
