// Entry point for the build script in your package.json
//= require bootstrap-datepicker
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { DateRangePicker } from 'vanillajs-datepicker';


const elem = document.getElementById('rent');

if (elem) {
  const rangepicker = new DateRangePicker(elem, {
    format: "dd/mm/yyyy"
  });
}
