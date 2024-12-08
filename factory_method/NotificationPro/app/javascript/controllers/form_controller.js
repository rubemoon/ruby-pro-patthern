import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["jsonInput"]

  addJsonTemplate() {
    const jsonTemplate = `{
      "user_id": 1,
      "message": "Test message",
      "notification_type": "push"
    }`
    this.jsonInputTarget.value = jsonTemplate
  }

  toggleTheme() {
    this.jsonInputTarget.classList.toggle('dark:bg-black')
    this.jsonInputTarget.classList.toggle('dark:text-green-500')
    this.jsonInputTarget.classList.toggle('dark:border-gray-700')
    this.jsonInputTarget.classList.toggle('bg-white')
    this.jsonInputTarget.classList.toggle('text-black')
    this.jsonInputTarget.classList.toggle('border-gray-300')
  }
}