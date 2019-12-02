import "bootstrap";
// import "select2";
// import "select2-bootstrap.css";

import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {

});

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import 'mapbox-gl-draw/dist/mapbox-gl-draw.css'; 

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

