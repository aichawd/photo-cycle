import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form'];

  updatestatus(event) {
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/html" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }

}
