import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  submitAction () {
    this.element.nextElementSibling.querySelector('button[type=submit]').click()
  }
}
