import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-picture"
export default class extends Controller {
  static targets = [ "input", "preview", "removeLink" ]

  upload() {
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onloadend = function() {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = "profile.jpg";
    }
  }

  removeImage() {
    event.preventDefault();
    let preview = this.previewTarget;
    let input = this.inputTarget;
    let imagePath = this.element.getAttribute("data-image");

    input.value = "";
    input.classList.add("delete")
  
    if (imagePath) {
      preview.src = imagePath;
    } else {
      console.error("Image path not found");
    }
  }

  submitForm() {
    event.preventDefault();
    let input = this.inputTarget;
    let removeLink = this.hasRemoveLinkTarget ? this.removeLinkTarget : null;

    if(input.classList.contains("delete")) {
      removeLink && removeLink.click();
      input.classList.remove("delete");
      input.value = "";
      this.element.submit();
    } else {
      input.classList.remove("delete");
      this.element.submit();
    }
  }
}
