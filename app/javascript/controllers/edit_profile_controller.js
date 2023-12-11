import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-profile"
export default class extends Controller {
  static targets = [ "input", "preview", "removeLink", "name", "nameError" ]

  upload() {
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();
    let imagePath = this.element.getAttribute("data-image");

    reader.onloadend = function() {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
    } else {
      preview.src = imagePath;
    }
  }

  removeImage() {
    event.preventDefault();
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let imagePath = this.element.getAttribute("data-image");

    input.value = "";
    input.setAttribute("data-delete", "true");

    if (imagePath) {
      preview.src = imagePath;
    } else {
      console.error("Image path not found");
    }
  }

  submitForm() {
    event.preventDefault();
    let name = this.nameTarget;
    let nameError = this.nameErrorTarget;

    if (name.value == "") {
      name.focus();
      nameError.classList.remove("hidden");
      name.classList.add("input-error");
      return;
    }

    let input = this.inputTarget;
    let removeLink = this.hasRemoveLinkTarget ? this.removeLinkTarget : null;

    if (input.getAttribute("data-delete") === "true") {
      removeLink && removeLink.click();
      input.removeAttribute("data-delete");
      input.value = "";
      this.element.submit();
    } else {
      input.removeAttribute("data-delete");
      this.element.submit();
    }
  }
}
