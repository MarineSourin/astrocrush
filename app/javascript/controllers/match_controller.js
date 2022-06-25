import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["trash"]

  connect() {
    console.log("coucou match controller")
    // Quand je clique sur l'icone des 3 points, faire s'afficher la div avec l'option delete.
  }
  displayDropdown(){
    console.log()
    this.trashTarget.classList.remove('d-none')
  }
}
