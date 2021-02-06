import { Controller } from "stimulus";
require("select2/dist/css/select2");
require("select2-bootstrap-theme/dist/select2-bootstrap");

// eslint-disable-next-line no-unused-vars
import Select2 from "select2";

export default class extends Controller {
  static targets = ["select2"];

  initialize() {
    // eslint-disable-next-line no-unused-vars
    var $input = $(this.select2Target).select2({
      placeholder: "Choose one or multiple services",
    });
  }
}
