client = new Faye.Client('/faye')

client.subscribe '/message/new', (message)->
  location.reload()

window.client = client
