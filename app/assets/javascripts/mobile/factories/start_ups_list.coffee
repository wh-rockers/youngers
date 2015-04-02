startUps.factory 'StartUpsList', ($http) ->

  StartUpsList = ->
    @items = []
    @busy = false
    @per_page = 20
    @page = 0
    return


  StartUpsList::nextPage = ->
    if @busy
      return
    @busy = true
    url = "/start_ups.json?per_page=#{@per_page}&page=#{@page}"
    $http.get(url)
      .success (data) ->
        @items = @items.concat(data)
        @busy = false
        @page += 1
        return
      .error (err) ->
        console.log err
        return
      .bind(this)
    return


  StartUpsList