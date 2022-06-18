// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "input", 'picturesContainer' ]

  connect() {
    console.log(this.picturesContainerTarget)
  }

  search(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const urlWithQuery = `${url}?query=${this.inputTarget.value}`

    fetch(urlWithQuery, {})
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      this.picturesContainerTarget.innerHTML = data.html
    })
  }

  searchByTag(event) {
    event.preventDefault()
    const tag = event.currentTarget.dataset.tagName
    const url = this.formTarget.action
    const urlWithQuery = `${url}?query=${tag}`

    fetch(urlWithQuery, {})
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      this.picturesContainerTarget.innerHTML = data.html
    })
  }
}
