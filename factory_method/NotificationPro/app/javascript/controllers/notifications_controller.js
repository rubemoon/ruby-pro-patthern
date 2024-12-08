import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "newIcon"]

  connect() {
    this.checkForNewNotifications()
  }

  toggle() {
    this.menuTarget.classList.toggle("hidden")
    this.newIconTarget.classList.add("hidden")
  }

  checkForNewNotifications() {
    // Assuming you have a way to check for new notifications
    // For example, you can fetch from an API or use a global variable
    const hasNewNotifications = true // Replace with actual check

    if (hasNewNotifications) {
      this.newIconTarget.classList.remove("hidden")
    }
  }
}