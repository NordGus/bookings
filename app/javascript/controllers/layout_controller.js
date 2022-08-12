import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['modal']

  openModal(_event) {
    this.modalTarget.classList.toggle('is-active', true)
  }

  closeModal(_event) {
    this.modalTarget.classList.toggle('is-active', false)
  }
}
