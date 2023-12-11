import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-profile"
export default class extends Controller {
  static targets = [ "bio" ]
  
  showMore() {
    let bio = this.bioTarget

    bio.innerHTML = bio.attributes["data-full-bio"].value
  }
}
