import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "optionsPanel"]
  static values = { shownTypes: Array }

  check() {
    if (this.shownTypesValue.includes(this.selectTarget.value)) {
      this.optionsPanelTarget.classList.remove("hidden")
    } else {
      this.optionsPanelTarget.classList.add("hidden")
    }
  }
}