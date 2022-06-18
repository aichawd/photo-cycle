import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modal"];
  view(event) {
    let modalController = this.application.getControllerForElementAndIdentifier(
        this.modalTarget,
        "modal"
    );
    console.log(event.currentTarget.innerHTML);
    modalController.setPhotoContent(event);
    modalController.open();
  }
}
