import mapboxgl from 'mapbox-gl';
// import MapboxDirections from '@mapbox/mapbox-gl-directions';

// async function getRoute(coords) {
// 	const get_url = 'https://api.mapbox.com/optimized-trips/v1/mapbox/driving/13.388860,52.517037;13.397634,52.529407;13.428555,52.523219;13.418555,52.523215?roundtrip=true&distributions=3,1&access_token=pk.eyJ1IjoiY2VzYXJjcm9zcyIsImEiOiJjazNvdGN2M3kxdXlhM2duNDVjdTBjZm11In0.8sdQ91wte8bcR7vB8Q5y9w'
// 	//const get_url = `https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords[0].lat};${coords[0].lng};${coords[1].lat};${coords[1].lng}?roundtrip=true&distributions=3,1&access_token=`
// 	const response = await fetch(get_url)
// 	const data = await response.json()
// 	const markers = data.waypoints.map((points) => {
// 				return {lat: points.location[1] , lng: points.location[0]} 
// 		});
// 	return markers			
// } 


// const directions = new MapboxDirections({
//   accessToken: 'pk.eyJ1IjoiY2VzYXJjcm9zcyIsImEiOiJjazNvdGN2M3kxdXlhM2duNDVjdTBjZm11In0.8sdQ91wte8bcR7vB8Q5y9w',
//   unit: 'metric',
//   profile: 'mapbox/cycling'
// })

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
  	 			"line-color": "#2e279d",
  	 			"line-width": 3,
  	 			"line-dasharray": [0.1, 1.8]
  	 		}
  	 	});
  	 	// map.addControl(directions,`top-left`)
  	 });
  	}
  };

  export { initMapbox };

