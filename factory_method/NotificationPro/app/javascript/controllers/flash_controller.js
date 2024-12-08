import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["alert"]

  connect() {
    setTimeout(() => {
      this.alertTargets.forEach((alert) => {
        alert.classList.add("opacity-0")
        setTimeout(() => alert.remove(), 1000)
      })
    }, 5000)
  }
}