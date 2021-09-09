import { timers } from "jquery";
import { Controller } from "stimulus";

export default class extends Controller {

  connect() {
    console.log(this.element);
    this.element.src = this.generateString();
    setInterval(() => {
      this.element.src = this.generateString();
    }, 5000);
  }

  generateString() {
    let horario = new Date();
    let stringhorario = (`21090${horario.getDate()}${horario.getHours()}${horario.getMinutes()-1}${horario.getSeconds()}00`);
    let refreshlink = (`https://camerastamoios.vwi.com.br/KM12/KM%2012_${stringhorario}.jpg`);
    console.log(refreshlink);
    return refreshlink;

  }


}
