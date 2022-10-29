import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rent-calculator"
export default class extends Controller {
  connect() {
    console.log("Hello from rent_calculator_controller.js!");
  }

  makeDate(dateString) {
    dateString = dateString.split('/');
    const date = new Date(dateString[2], dateString[1], dateString[0]);
    return date
  }

  calculateDays() {
    const checkIn = document.getElementById("check-in").value
    const checkOut = document.getElementById("check-out").value

    const checkInDate = this.makeDate(checkIn)
    const checkOutDate = this.makeDate(checkOut)

    const difference = (checkOutDate - checkInDate) / (1000 * 3600 * 24);

    return difference
  }

  calculatePrice(days) {
    const pricePerDay = document.getElementById("price-per-day").dataset.price
    const priceFloat = parseFloat(pricePerDay)
    const totalPrice = days * priceFloat
    return `R$${totalPrice.toLocaleString('pt-BR')},00`
  }

  applyChanges() {
    this.changeElement('number-of-days', this.calculateDays())
    this.changeElement('total-price', this.calculatePrice(this.calculateDays()))

    document.getElementById('submit-btn').classList.remove('disabled')
  }

  changeElement(id, data) {
    const element = document.getElementById(id)
    element.innerText = data
  }
}
