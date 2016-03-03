# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.station-checkbox').change ->
    station_id = $(this).data 'station'
    if $('#station-'+station_id+'-value_types').is(':visible')
      console.log "yes"
      $('#station-'+station_id+'-value_types').find(':input').each (index, checkbox) ->
        $(checkbox).prop( "checked", false );
    # Toggle div show/hide
    $('#station-'+station_id+'-value_types').toggle()




$(document).ready ->
  $('.value_type-checkbox').change ->
    chart = $('#chart-container').highcharts();
    chart.showLoading('Loading data from server...');



    console.log

    if $(this).prop( "checked" )
      # Add selected Serie
      timeserie =
        name: $(this).data 'value_type-name'
        station_id: $(this).data 'station'
        station_name: $(this).data 'station-name'
        value_type_id: $(this).data 'value_type'
        unit: $(this).data 'value_type-unit'
        startT: moment($('#startDate').val(), "YYYY-MM-DD").valueOf()
        endT: moment($('#endDate').val(), "YYYY-MM-DD").valueOf()
      url = 'http://localhost:3000/api/v1/measurements/station/' + timeserie.station_id + '/value_type/' + timeserie.value_type_id + '/start/' + timeserie.startT + '/end/' + timeserie.endT + '.json'
      $.getJSON(url, (data) ->
        chart.addSeries {
          name: timeserie.name
          data: data
          id: timeserie.value_type_id
          unit: timeserie.unit
          station_name: timeserie.station_name
        }
        chart.hideLoading();
      ).error (jqXHR, textStatus, errorThrown) ->
        console.log 'error ' + textStatus
        return
    else
      # Remove selected Serie
      chart.get($(this).data 'value_type').remove()
      chart.hideLoading();





$(document).ready ->
  $('#chart-container').highcharts 'StockChart',
    rangeSelector: selected: 4
    yAxis:
      plotLines: [ {
        value: 0
        width: 2
        color: 'silver'
      } ]
    xAxis:
      minRange: 1000 * 6000
      minTickInterval: 600 * 1000
      allowDecimals: false
    tooltip:
      pointFormat: '{series.options.station_name}: <span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({series.options.unit})<br/>'
      valueDecimals: 3
    series: []
  return


