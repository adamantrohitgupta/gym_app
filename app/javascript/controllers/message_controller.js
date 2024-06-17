import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
    
    
  connect() {
   this.scrollToBottom();
   this.clearMessageText();
    
  }


  scrollToBottom() {
    const messagesContainer = document.getElementById("messages");
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
  }
   
   
  clearMessageText(){ 
    const messagesContainer = document.getElementById("messages");
    const  btn = document.getElementById('msgbtn');
    let  form = document.getElementById('message-form');
      btn.addEventListener('click', function(){
      setTimeout(() => {
          form.reset();
      }, 100);

      setTimeout(()=>{
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },150)    
    });
  }
}
