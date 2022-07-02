import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    var msnry = new Masonry( this.element, {
      // options...
      itemSelector: '.masonry-element',
      columnWidth: 200
    });
  }
}
