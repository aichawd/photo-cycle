import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tag", "image" ]

  connect() {
    console.log("controller connected")
  }

  all() {
    this.imageTargets.forEach(element => {
      element.classList.remove("d-none")
    });
  }

  filter(event) {
    const category = event.currentTarget.dataset.tagName
    const regex = new RegExp(category)
    const imagesToHide = this.imageTargets.filter((image) => {
      return !image.dataset.categories.match(regex)
    })
    this.all()
    imagesToHide.forEach(element => {
      element.classList.add("d-none")
    });
  }

}
