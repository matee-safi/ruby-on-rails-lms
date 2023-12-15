import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="settings"
export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    const theme = document.documentElement.getAttribute("data-theme")
    if (theme) {
      this.inputTarget.value = theme
    }
  }

  changeTheme() {
    const theme = this.inputTarget.value
    document.documentElement.setAttribute("data-theme", theme)
    document.cookie = `theme=${theme}; path=/; expires=Fri, 31 Dec 9999 23:59:59 GMT`;
  }
}
