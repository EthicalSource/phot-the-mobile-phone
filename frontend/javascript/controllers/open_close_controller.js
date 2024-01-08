import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static classes = [ 'open' ]

  updateState(e) {
    e.preventDefault();
    if (this.isOpen()) {
      this.closeElement()
    } else {
      this.openElement()
    }
  }

  isOpen() {
    return [...this.element.classList].includes(this.openClass)
  }

  closeElement() {
    this.element.classList.remove(this.openClass)
  }

  openElement() {
    this.element.classList.add(this.openClass)
  }
}