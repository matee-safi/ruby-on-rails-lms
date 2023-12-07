import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blog-image-preview"
export default class extends Controller {
  static targets = ["input", "preview"]

  preview() {
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onload = function () {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }
  }

  removeImage() {
    let input = this.inputTarget;
    let preview = this.previewTarget;

    input.value = "";
    preview.src = "https://www.eventbrite.com/engineering/wp-content/uploads/engineering/2018/08/Flexible-Reusable-React-File-Uploader.png";
  }
}
