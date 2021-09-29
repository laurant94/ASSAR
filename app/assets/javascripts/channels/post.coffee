App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->

    

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.action is "like"
      $("#post-#{data.post.id}")
      .children('.state')
      .children('.state-like')
      .text(data.count)
      if data.message
        toastr.success(data.message)

    else if data.action is "comment"
      $('#comments').append(data.html)
      $("#post-#{data.post.id}").children('.state').children('.state-comment').text(data.count)

    else if data.action is "favorite"
      $("#post-#{data.post.id}")
      .children('.state')
      .children('.state-favorite')
      .text(data.count)
      if data.message
        toastr.success(data.message)