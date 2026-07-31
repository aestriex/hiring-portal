import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "checkmark", "input"]

  toggle() {
    const isChecked = this.checkmarkTarget.classList.contains("hidden")

    if (isChecked) {
      this.checkmarkTarget.classList.remove("hidden")
      this.buttonTarget.dataset.state = "checked"
      this.inputTarget.checked = true
    } else {
      this.checkmarkTarget.classList.add("hidden")
      this.buttonTarget.dataset.state = "unchecked"
      this.inputTarget.checked = false
    }
  }
}