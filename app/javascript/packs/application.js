import "bootstrap";
// import "select2";
// import "select2-bootstrap.css";

import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {

});

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();
