import { Application } from "@hotwired/stimulus"
import MessageController from "./message_controller"

const application = Application.start()
application.register("message", MessageController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
