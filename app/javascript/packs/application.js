import "bootstrap";
// import "select2";
// import "select2-bootstrap.css";

import flatpickr from 'flatpickr'
import 'flatpickr/dist/flatpickr.min.css'

flatpickr(".datepicker", {

});

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
