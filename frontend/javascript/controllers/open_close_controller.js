import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static classes = [ 'open', 'closed', 'closing' ]
  static targets  = [ 'menu' ]

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

  openElement() {
    this.element.classList.add(this.openClass)
    this.element.classList.remove(this.closedClass)

    this.attachCloseEventsListeners()
  }

  closeElement() {
    this.element.classList.remove(this.openClass)
    this.element.classList.add(this.closingClass)
    this.waitThenApplyClosedClass()

    this.detachCloseEventListeners()
  }

  waitThenApplyClosedClass() {
    setTimeout(()=>{
      this.element.classList.add(this.closedClass)
      this.element.classList.remove(this.closingClass)
    }, 750)
  }

  attachCloseEventsListeners() {
    document.addEventListener("keydown", this.closeOnEscKeyListener());
  }

  detachCloseEventListeners() {
    document.removeEventListener("keydown", this.closeOnEscKeyListener())
  }

  closeOnEscKeyListener() {
    const listener = e => {
      if (e.key === "Escape") {
        this.closeElement();
      }
    }
    return listener;
  }
}