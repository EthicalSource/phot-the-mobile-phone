import { Controller } from '@hotwired/stimulus';

const menuText = document.getElementById('menu-text');
const menuButton = document.getElementById('menu-button');
const nav = document.getElementById('nav-menu')

export default class extends Controller {
  static classes = [ 'open', 'closed', 'closing' ]
  static targets  = [ 'menu' ]

  updateState(e) {
    e.preventDefault();
    if (this.isOpen()) {
      menuText.textContent = 'Menu';
      menuButton.setAttribute("aria-expanded", false)
      nav.setAttribute("aria-expanded", false)
      this.closeElement()
    } else {
      menuText.textContent = 'Close Menu'
      menuButton.setAttribute("aria-expanded", true)
      nav.setAttribute("aria-expanded", true)
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