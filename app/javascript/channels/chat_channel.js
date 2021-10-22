import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const chat_element = document.getElementById('chat-id');
  const chat_id = chat_element.getAttribute('data-chat-id');
  consumer.subscriptions.subscriptions.forEach((subscription) => {
    consumer.subscriptions.remove(subscription)
  })
  consumer.subscriptions.create({channel: "ChatChannel", chat_id: chat_id}, {
    connected() {
      console.log("connected to " + chat_id)
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data)
      $('#chats_area').append("<div class='col pl-2 mb-2 float-left' style='max-width:51%;'>"+
        "<p class='m-0 p-2 rounded text-primary' style='background:#F7F2A8'>"+data.message+"</p></div>"+
      "<span style='font-size:.8em;'>"+data.date+"</span>");

      $("#chat_message").val('');
     },
  });
})
