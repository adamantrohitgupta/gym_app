import { Application } from "@hotwired/stimulus"
import MessageController from "./message_controller"
import RoomController from "./room_controller"

const application = Application.start()
application.register("message", MessageController)
application.register("room_message", RoomController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
