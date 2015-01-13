topicLocationMap = ->
  map = new BMap.Map("topic-location-baidu-map")
  map.centerAndZoom(new BMap.Point(114.405012,30.513192), 15);
  map.enableScrollWheelZoom()
  map.enableContinuousZoom()
  local = new BMap.LocalSearch("武汉市",
    renderOptions:
      map: map
      selectFirstResult: false    
    pageCapacity: 1
  )
  $("#topic_location").focus ->
    $("#topic-location-baidu-map").css('visibility', 'visible')
  $("#topic_location").focusout ->
    $("#topic-location-baidu-map").css('visibility', 'hidden')
  $("#topic_location").on 'keyup', ->
    address = $("#topic_location").val()
    console.log address
    address = "光谷" if address.length == 0
    local.search "#{address}"

topicLocationMap()