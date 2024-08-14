import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {

  static targets = ["startDate", "endDate", "price", "days", "subtotal", "total"];

  connect() {
    console.log(this.startDateTarget)

    console.log(this.endDateTarget)
  }

  calculate() {
    console.log("calculate!")
    console.log(this.startDateTarget.value)

    console.log(this.endDateTarget.value)
    const startDate = Date.parse(this.startDateTarget.value)
    const endDate = Date.parse(this.endDateTarget.value)
    console.log()
    const days = (endDate - startDate) / 8.64e+7
    this.daysTarget.innerText = days
    this.subtotalTarget.innerText = days * Number(this.priceTarget.innerText)
    this.totalTarget.innerText = (days * Number(this.priceTarget.innerText)) + 250
  }
}
