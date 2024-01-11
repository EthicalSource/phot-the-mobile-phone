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
    this.detachCloseEventListeners()

  }

  openElement() {
    this.element.classList.remove(this.closeClass)
    this.element.classList.add(this.openClass)
    this.attachCloseEventsListeners()
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