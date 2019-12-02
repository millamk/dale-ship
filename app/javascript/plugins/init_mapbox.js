import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
  	mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  	const markers = JSON.parse(mapElement.dataset.markers);
  	markers.forEach((marker) => {
  	  new mapboxgl.Marker()
  	    .setLngLat([ marker.lng, marker.lat ])
  	    .addTo(map);
  	});
  	 // only build a map if there's a div#map to inject into
  	fitMapToMarkers(map, markers);
  	map.on('load', function () {
  	 
  	map.addLayer({
  	"id": "route",
  	"type": "line",
  	"source": {
  	"type": "geojson",
  	"data": {
  	"type": "Feature",
  	"properties": {},
  	"geometry": {
  	"type": "LineString",
  	"coordinates": [
  	 [markers[0].lng, markers[0].lat],
  	 [markers[1].lng, markers[1].lat]
  	]
  	}
  	}
  	},
  	"layout": {
  	"line-join": "round",
  	"line-cap": "round"
  	},
  	"paint": {
  	"line-color": "#888",
  	"line-width": 8
  	}
  	});
  	});
  }
};

export { initMapbox };

