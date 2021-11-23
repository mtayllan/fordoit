import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  submitAction () {
    this.element.nextElementSibling.querySelector('input[type=submit]').click()
  }
}
