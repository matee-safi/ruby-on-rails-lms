import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blog-form"
export default class extends Controller {
  static targets = [ "input", "preview", "removeLink", "title", "content", "titleError", "contentError" ]

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
    let title = this.titleTarget;
    let titleError = this.titleErrorTarget;
    let content = this.contentTarget;
    let contentError = this.contentErrorTarget;

    if (title.value == "" && content.value == "") {
      title.focus();
      titleError.classList.remove("hidden");
      title.classList.add("input-error");
      contentError.classList.remove("hidden");
      content.classList.add("textarea-error");
    } else if (title.value === "") {
      title.focus();
      titleError.classList.remove("hidden");
      title.classList.add("input-error");
      contentError.classList.add("hidden");
      content.classList.remove("textarea-error");
    } else if (content.value === "") {
      content.focus();
      contentError.classList.remove("hidden");
      content.classList.add("textarea-error");
      titleError.classList.add("hidden");
      title.classList.remove("input-error");
    } else {      
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
}
