import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "heart" ]

  like(event) {
    event.currentTarget.classList.add("red")
  }

}
