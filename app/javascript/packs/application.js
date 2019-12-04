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

import { loadDynamicBannerText } from '../components/banner';
if (document.querySelector('#banner-typed-text') !== null) {
    loadDynamicBannerText();
}

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();


import { refreshStatus } from '../components/change-status';
refreshStatus();

import expiredTable from '../components/expiredTable';
expiredTable();

