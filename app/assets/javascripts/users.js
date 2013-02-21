var oTable;
jQuery(document).ready( function(){ 
  $('#myTable').dataTable({
    "sDom": "<'row-fluid'<'span8'l><'span8'f>r>t<'row-fluid'<'span8'i><'span8'p>>",
  "sPaginationType": "bootstrap"
  });
  $('#aminoTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#aminoTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = $('#aminoTable tr.row_selected td:nth-child(2)').text().trim();
      $('#tpn_amino_acid_additive_id').val(value);
    }
  });
  $('#sodiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#sodiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = $('#sodiumTable tr.row_selected td:nth-child(2)').text().trim();
      $('#tpn_sodium_chloride_additive_id').val(value);
    }
  });
  $('#potassiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#potassiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = $('#potassiumTable tr.row_selected td:nth-child(2)').text().trim();
      $('#tpn_potassium_chloride_additive_id').val(value);
    }
  });
  $('#magnesiumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#magnesiumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = $('#magnesiumTable tr.row_selected td:nth-child(2)').text().trim();
      $('#tpn_magnesium_additive_id').val(value);
    }
  });
  $('#calciumTable tbody tr').click( function (e) {
    if($(this).hasClass('row_selected')) {
      $(this).removeClass('row_selected');
    }
    else{
      $('#calciumTable tr.row_selected').removeClass('row_selected');
      $(this).addClass('row_selected');
      var value = $('#calciumTable tr.row_selected td:nth-child(2)').text().trim();
      $('#tpn_calcium_additive_id').val(value);
    }
  });

});
