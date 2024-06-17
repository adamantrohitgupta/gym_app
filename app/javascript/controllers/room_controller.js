import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room"
export default class extends Controller {
  connect() {
    this.clearRoomText();
  }
 

  clearRoomText(){
    document.getElementById('roomSubmitBtn')
    .addEventListener('click', function(){
      setTimeout(function(){
       document.getElementById('roomform').reset()

      },100)
    });
  }
}
