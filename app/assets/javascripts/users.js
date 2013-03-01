var oTable;
jQuery(document).ready( function(){ 
  $('#myTable').dataTable({
    "sDom": "<'row-fluid'<'span8'l><'span8'f>r>t<'row-fluid'<'span8'i><'span8'p>>",
  "sPaginationType": "bootstrap"
  });
  $('#amino').popover({html: true, placement:'left', content:$('#amino-modal').html()});
  $('#amino').click( function (e) { 
  $('#aminoTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#aminoTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = parseFloat($('#aminoTable tr.row_selected td:nth-child(3)').text().trim());
      var id = $('#aminoTable tr.row_selected td:nth-child(1)').text().trim();
      $('#tpn_amino_acid_additive_id').val(id);
      $('#amino_acid_additive').val(value);
      $('#amino').popover('hide');
    }
  });
  });
  $('#sodium').popover({html: true, placement:'left', content:$('#sodium-modal').html()});
  $('#sodium').click( function (e) { 
  $('#sodiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#sodiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = parseFloat($('#sodiumTable tr.row_selected td:nth-child(3)').text().trim());
      var id = $('#sodiumTable tr.row_selected td:nth-child(1)').text().trim();
      $('#sodium_chloride_additive').val(value);
      $('#tpn_sodium_chloride_additive_id').val(id);
      $('#sodium').popover('hide');
    }
  });
  });
  $('#potassium').popover({html: true, placement:'left', content:$('#potassium-modal').html()});
  $('#potassium').click( function (e) { 
  $('#potassiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#potassiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = parseFloat($('#potassiumTable tr.row_selected td:nth-child(3)').text().trim());
      var id = $('#potassiumTable tr.row_selected td:nth-child(1)').text().trim();
      $('#potassium_chloride_additive').val(value);
      $('#tpn_potassium_chloride_additive_id').val(id);
      $('#potassium').popover('hide');
    }
  });
  });

  $('#magnesium').popover({html: true, placement:'left', content:$('#magnesium-modal').html()});
  $('#magnesium').click( function (e) { 
  $('#magnesiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#magnesiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = parseFloat($('#magnesiumTable tr.row_selected td:nth-child(3)').text().trim());
      var id = $('#magnesiumTable tr.row_selected td:nth-child(1)').text().trim();
      $('#magnesium_additive').val(value);
      $('#tpn_magnesium_additive_id').val(id);
      $('#magnesium').popover('hide');
    }
  });
  });

  $('#calcium').popover({html: true, placement:'left', content:$('#calcium-modal').html()});
  $('#calcium').click( function (e) { 
  $('#calciumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#calciumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = parseFloat($('#calciumTable tr.row_selected td:nth-child(3)').text().trim());
      var id = $('#calciumTable tr.row_selected td:nth-child(1)').text().trim();
      $('#calcium_additive').val(value);
      $('#tpn_calcium_additive_id').val(id);
      $('#calcium').popover('hide');
    }
  });
  });
});
