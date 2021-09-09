// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("bootstrap-datepicker")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// require bootstrap-datepicker


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------



// External imports

import "bootstrap"
window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
import flatpickr from "flatpickr"
//import { initAutocomplete } from "./autocomplete";
//import { scrollListen } from './scroll'
//import { requestFromApi } from './weatherAPI'
import { initUpdateNavbarOnScroll } from '../components/navbar';
//import { switchTheme } from './darktheme';
import { weatherAPI } from './weatherAPI';
import { partialJsTripForm, preventBackOnIndex} from './tripsIndex.js'
import { showFormOnClick } from './info.js'
import { paintChartOnClick } from './info.js'
import { initMap } from './googleMaps.js'
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));




document.addEventListener('turbolinks:load', () => {
  partialJsTripForm();
  // Call your functions here, e.g:
  // initSelect2();
  //initAutocomplete();
  initUpdateNavbarOnScroll();
  showFormOnClick();
  //switchTheme();
  //scrollListen();
  //requestFromApi('Ubatuba');
  weatherAPI();
  preventBackOnIndex();
  flatpickr(".datepicker", { minDate: Date.now()});
  flatpickr(".timepicker", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true
  });
  initMap();
  paintChartOnClick();



  const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  const popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })


});
