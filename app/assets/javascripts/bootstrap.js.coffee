set_chart = (chart) ->
  chart.highcharts
    chart: type: chart.data('chart')
    title: text: chart.data('title')
    subtitle: text: chart.data('subtitle')
    xAxis: type: 'category'
    yAxis: title: text: chart.data('titleY')
    legend: enabled: false
    plotOptions: series:
      borderWidth: 0
      dataLabels:
        enabled: true
        format: '{point.y} votos'
    tooltip:
      headerFormat: '<span style="font-size:11px">{series.name}</span><br>'
      pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}votos</b> <br/>'
    series: [ {
      name: chart.data('seriesName')
      colorByPoint: true
      data: chart.data('data')
    } ]

highcharts_init = ->
  init = document.querySelector('.highcharts')
  if init
    $('.highcharts').each (e) ->
      set_chart $(this)

jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  highcharts_init()
