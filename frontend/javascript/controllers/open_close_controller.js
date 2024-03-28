import { Controller } from '@hotwired/stimulus';

const menuButton = document.getElementById('menu-button');

export default class extends Controller {
  static classes = [ 'open', 'closed', 'closing' ]
  static targets  = [ 'menu' ]

  updateState(e) {
    e.preventDefault();
    if (this.isOpen()) {
      menuButton.textContent = 'Menu';
      this.closeElement()
    } else {
      menuButton.textContent = 'Close Menu'
      this.openElement()
    }
  }

  isOpen() {
    return [...this.element.classList].includes(this.openClass)
  }

  openElement() {
    this.element.classList.add(this.openClass)
    this.element.classList.remove(this.closedClass)
    document.body.classList.add('no--scroll')
    this.attachCloseEventsListeners()
  }

  closeElement() {
    this.element.classList.remove(this.openClass)
    this.element.classList.add(this.closingClass)
    document.body.classList.remove('no--scroll')
    this.waitThenApplyClosedClass()

    this.detachCloseEventListeners()
  }

  waitThenApplyClosedClass() {
    setTimeout(()=>{
      this.element.classList.add(this.closedClass)
      this.element.classList.remove(this.closingClass)
    }, 250)
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