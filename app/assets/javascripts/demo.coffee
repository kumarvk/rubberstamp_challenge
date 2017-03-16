# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

formatDate = (timeStamp) ->
  d = new Date(timeStamp)
  dformat = [
    (d.getMonth() + 1).padLeft()
    d.getDate().padLeft()
    d.getFullYear()
  ].join('/') + ' ' + [
    d.getHours().padLeft()
    d.getMinutes().padLeft()
  ].join(':')
  dformat

Number::padLeft = (base, chr) ->
  len = String(base or 10).length - (String(this).length) + 1
  if len > 0 then new Array(len).join(chr or '0') + this else this

formatTimeStamp = (data, type, full, meta) ->
  formatDate data

$(document).ready ->
  $.ajax
    url: 'json_data.json'
    success: (result) ->
      $('#example').DataTable
        data: result
        ordering: true
        order: [0]
        columns: [
          { data: 'id', "searchable": false, 'orderable': true}
          { data: 'creator_name', "searchable": false, 'orderable': false }
          { data: 'amount', "searchable": false, 'orderable': false }
          { data: 'status', "searchable": false, 'orderable': false }
          { data: 'supplier_name', "searchable": false, 'orderable': false }
          { data: 'keywords','visible': false, "searchable": true, 'orderable': false}
          { data: 'created_at' , "searchable": false, "render": formatTimeStamp , 'orderable': false}
          { data: 'currency_id', 'visible': false, "searchable": false , 'orderable': false}
          { data: 'currency_symbol', "searchable": false , 'orderable': false}
          { data: 'total_gross_amount', "searchable": false, 'orderable': false}
          { data: 'total_net_amount', "searchable": false, 'orderable': false}
          { data: 'base_gross_amount', "searchable": false, 'orderable': false}
        ]
      return