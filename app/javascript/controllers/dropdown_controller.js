import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    toggle(event) {
        event.stopPropagation()
        this.menuTarget.classList.toggle("hidden")
    }

    connect() {
        this.closeHandler = () => this.menuTarget.classList.add("hidden")
        document.addEventListener("click", this.closeHandler)
    }

    disconnect() {
        document.removeEventListener("click", this.closeHandler)
    }
}