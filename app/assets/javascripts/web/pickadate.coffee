datePicker = ->
  dateOptions = {
    monthsFull: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    weekdaysShort: ['日', '一', '二', '三', '四', '五', '六'],
    today: '今天',
    clear: '清除选择',
    close: '',
    formatSubmit: 'yyyy-mm-dd'
  }
  timeOptions = {
    clear: '清除选择',
    format: 'HH:i',
    formatSubmit: "HH:i"
  }
  $("#start_date, #end_date").pickadate(dateOptions)
  $('#start_time, #end_time').pickatime(timeOptions)

datePicker()