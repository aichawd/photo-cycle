import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["photo"];

  setPhotoContent(event) {
    this.photoTarget.innerHTML = event.currentTarget.innerHTML;
    const boitier = event.currentTarget.dataset.boitier;
    const objectif = event.currentTarget.dataset.objectif;
    const ouverture = event.currentTarget.dataset.ouverture;
    const tempspose = event.currentTarget.dataset.tempspose;
    const sensibilite = event.currentTarget.dataset.sensibilite;
    const techDetails = `<div class="tech-details"> <span><i class="fas fa-camera-retro"></i> ${boitier}</span>
                              <span><i class="fas fa-bullseye"></i> ${objectif}</span>
                              <span>${ouverture}</span>
                              <span>${tempspose}</span> <span>${sensibilite}</span>
                          </div>`
    this.photoTarget.insertAdjacentHTML("beforeend", techDetails)
  }

  open() {
    document.body.classList.add("modal-open");
    this.element.setAttribute("style", "display: block;");
    this.element.classList.add("show");
    document.body.innerHTML += '<div class="modal-backdrop fade show"></div>';
  }

  close() {
    document.body.classList.remove("modal-open");
    this.element.removeAttribute("style");
    this.element.classList.remove("show");
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}
