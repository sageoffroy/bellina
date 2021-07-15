$(document).on 'turbolinks:load', ->
  $('#footwears-datatable').dataTable
    processing: true
    serverSide: true
    ajax:
      url: $('#footwears-datatable').data('source')
    pagingType: 'full_numbers'
    language: 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
    bPaginate: true
    info: false
    responsive: true
    deferRender: true
    stateSave: true
    columns: [
      {data: 'sku'}
      {data: 'category'}
      {data: 'article'}
      {data: 'color'}
      {data: 'size'}
      {data: 'stock'}
      {data: 'options'}
    ]
