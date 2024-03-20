import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
    
    
  connect() {
   this.scrollToBottom();
   console.log("connected");
  }


  scrollToBottom() {
    const messagesContainer = document.getElementById("messages");
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
  }

}
