jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#message-body')

  if $messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "WebNotificationsChannel"
      },
      connected: ->
      	console.log(this)

      disconnected: ->
      	console.log('disconnected..')

      received: (data) ->
      	console.log(data)

      send_message: (message) ->
      	console.log('send message')