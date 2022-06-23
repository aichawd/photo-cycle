import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number, userId: Number}
  static targets = ["messages", 'scrollableMessages']

  connect() {
    console.log("hello")
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.processMessage(data) }
    )
  }

  /* #processMessage(data) {
    console.log(data.html)
    this.messagesTarget.insertAdjacentHTML("beforeend", data.html)
    this._scrollDown()
    } */
  resetForm(event) {
    event.target.reset()
  }
  disconnect() {
    this.channel.unsubscribe()
  }

  scrollDown() {
    this.scrollableMessagesTarget.scrollTo(0, 9999999999)
  }
  processMessage(data) {
    const sender = this.userIdValue == data.user_id
    // Use this method to transform the received HTML string into
    // an DomElement so that we can use .classList method on it
    const msgElement = this.buildHTML(data.html)
    // This is where we will remove the existing 'sender' class
    // on the received partial HTML if the message.user.id is different than
    // the current_user's
    // So that, in that case, the message will display on the left
    if (!sender) msgElement.classList.remove('sender')
    this.insertMessage(msgElement)
    this.scrollDown()

    }
    buildHTML(string) {
      const tmpDiv = document.createElement('div')
      tmpDiv.innerHTML = string
      return tmpDiv.firstElementChild
      }
      insertMessage(element) {
      this.messagesTarget.appendChild(element)
      }
      /* scrollDown() {
      this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
      } */ 


}
