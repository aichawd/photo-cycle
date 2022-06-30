import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tag", "image" ]

  allImages(event) {
    this.imageTargets.forEach(element => {
      element.classList.remove("d-none")
    });
    this.resetTags();
    event.currentTarget.classList.add("selected")
  }

  resetTags() {
    this.tagTargets.forEach(element => {
      element.classList.remove("selected")
    });
  }

  filter(event) {
    const category = event.currentTarget.dataset.tagName
    const regex = new RegExp(category)
    const imagesToHide = this.imageTargets.filter((image) => {
      return !image.dataset.categories.match(regex)
    })
    this.allImages(event)
    imagesToHide.forEach(element => {
      element.classList.add("d-none")
    });
  }

}
