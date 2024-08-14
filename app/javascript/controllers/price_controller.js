import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {

  static targets = ["startDate", "endDate", "price", "days", "subtotal", "total", "form", "confirmation"];

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

  // remove_form() {
  //   formTarget.style.display = "none"
  //   this.show_confirmation()
  // }

  // show_confirmation() {
  //   confirmationTarget.style.display = "initial"
  // }

  submit(event) {
    event.preventDefault();
    this.element.querySelector("form").style.display = "none"
    this.confirmationTarget.style.display = "block"
    const formData = new FormData(this.formTarget)
    console.log(this.formTarget.action)

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: formData
    })
  }



  //  // Handle successful form submission
  //  handleSuccess(event) {
  //   // Prevent default behavior
  //   event.preventDefault();

  //   // Hide the form and show the confirmation message
  //   this.formTarget.style.display = "none";
  //   this.confirmationTarget.style.display = "block";
  // }

  // // Allow the user to make a new request
  // newRequest() {
  //   // Show the form and hide the confirmation message
  //   this.formTarget.style.display = "block";
  //   this.confirmationTarget.style.display = "none";

  //   // Reset form fields if needed
  //   this.startDateTarget.value = Date.today.toISOString().split("T")[0];
  //   this.endDateTarget.value = Date.tomorrow.toISOString().split("T")[0];

  //   // Recalculate the price
  //   this.calculate();
  // }
}
