# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: false
    no_results_text: '无数据'
    width: '200px'


  $.datepicker.regional['zh-CN'] = {
    closeText: '关闭',
    prevText: '<上月',
    nextText: '下月>',
    currentText: '今天',
    monthNames: ['一月','二月','三月','四月','五月','六月',
      '七月','八月','九月','十月','十一月','十二月'],
    monthNamesShort: ['一','二','三','四','五','六',
      '七','八','九','十','十一','十二'],
    dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
    dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
    dayNamesMin: ['日','一','二','三','四','五','六'],
    weekHeader: '周',
    dateFormat: 'yy-mm-dd',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: '年'
  }

  $.datepicker.setDefaults($.datepicker.regional['zh-CN'])

  $('#production_date').datepicker()
  $('#production_date').attr( 'readOnly', 'true' )


  $('#inventories').dataTable
    "bStateSave": true
    "aLengthMenu": [[25, 50, 100, 200, 500, 1000, -1], [25, 50, 100, 200, 500, 1000, "所有"]]
    #禁用第三、七列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 0 ] }
    ]
    "oLanguage": {
      "sProcessing":   "处理中...",
      "sLengthMenu":   "显示 _MENU_ 项结果",
      "sZeroRecords":  "没有匹配结果",
      "sInfo":         "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
      "sInfoEmpty":    "显示第 0 至 0 项结果，共 0 项",
      "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
      "sInfoPostFix":  "",
      "sSearch":       "搜索:",
      "sUrl":          "",
      "sEmptyTable": "尚无库存！",
      "oPaginate": {
          "sFirst":    "首页",
          "sPrevious": "上页",
          "sNext":     "下页",
          "sLast":     "末页"
      }
    }
    #首次打开默认以第六列排序
    "aaSorting": [[ 0, "desc" ]]

