$(document).on 'turbolinks:load', ->
  $('#footwears-datatable').dataTable
    processing: true
    serverSide: true
    ajax:
      url: $('#footwears-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'sku'}
      {data: 'article'}
      {data: 'trademark'}
      {data: 'category'}
      {data: 'stock'}
      {data: 'options'}
    ]
