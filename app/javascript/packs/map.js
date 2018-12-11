import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
}


const lamapElement = document.getElementById('lamap');
if (lamapElement) { // don't try to build a lamap if there's no div#lamap to inject in
  const lamap = new GMaps({ el: '#lamap', lat: 0, lng: 0 });
  const marker = JSON.parse(lamapElement.dataset.marker);
  lamap.addMarker(marker);
  lamap.setCenter(marker.lat, marker.lng);
  lamap.setZoom(14);
  }

import { autocomplete } from '../components/autocomplete';

// [...]
autocomplete();
