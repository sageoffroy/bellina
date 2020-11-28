$(document).on 'turbolinks:load', ->
  $('#colors-datatable').dataTable
    processing: true
    serverSide: true
    ajax:
      url: $('#colors-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'name'}
      {data: 'swatch'}
      {data: 'hex_code'}
      {data: 'options'}
    ]
