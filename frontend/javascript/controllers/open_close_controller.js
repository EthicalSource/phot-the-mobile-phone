import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static classes = [ 'open', 'close' ]

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
    this.element.classList.add(this.closeClass)
  }

  openElement() {
    this.element.classList.remove(this.closeClass)
    this.element.classList.add(this.openClass)
  }
}