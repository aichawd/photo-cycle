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



  search(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const urlWithQuery = `feed?query=${this.inputTarget.value}`

    fetch(urlWithQuery, {headers: { "Accept": "text/plain"} })
    .then(response => response.text())
    .then((data) => {

      this.picturesContainerTarget.innerHTML = data
    })
  }

  searchByTag(event) {
    event.preventDefault()
    const tag = event.currentTarget.dataset.tagName
    const urlWithQuery = `feed?query=${tag}`

    fetch(urlWithQuery, {headers: { "Accept": "text/plain"}  } )
    .then(response => response.text())
    .then((data) => {

      this.picturesContainerTarget.innerHTML = data
    })
  }
}
