$(document).ready(function(){  
  $("#tpn").on('change', '#previous_tpn_date', function(event){ 
    $.ajax({ 
      url:"/hospitals/"+ hospital +"/tpn/previous_tpn",
    data:{ patient_id: $('#tpn_patient_id').val(), date: $('#previous_tpn_date').val() }, 
    });
  });

  $('#tpn').on('change', '#tpn_patient_name', function(event){ 
    $('#previous_tpn_date').popover('hide'); 
    if($('#tpn_patient_id').val() != "")
    $.ajax({ 
      url:"/hospitals/"+ hospital +"/tpn/previous_tpn_date", 
      method: 'POST',
      data:{ patient_id: $('#tpn_patient_id').val() } 
    });
  });
  addTypehead();
  form_load(dates);
  popover_bind();
  $('body').on('shown', '#new-tpn_infusion', function(){
    tpn_infusion()
  })
});

function calc_final_tpn(){
  $('#final_tpn_order').text((parseFloat($('#initial_tpn').text()) - parseFloat($('#tpn_tpn_infusion_attributes_feed_volume_over_24_hour').val()) -  parseFloat($('#tpn_tpn_infusion_attributes_arterial_line_infusion').val()) - parseFloat($('#tpn_tpn_infusion_attributes_inotrope_infusion').val()) - parseFloat($('#tpn_tpn_infusion_attributes_other_infusion').val())).toFixed(2));
}

function tpn_infusion(){  
  $('#tpn_tpn_infusion_attributes_feed_volume_over_24_hour').keydown(function(e){ 
    if ( $('#final_tpn_order').text() > 0.20 || e.keyCode == 40 ){
      calc_final_tpn()
    }
    else
    e.preventDefault();
  });
  $('#tpn_tpn_infusion_attributes_arterial_line_infusion').keydown(function(e){ 
    if ( $('#final_tpn_order').text() > 0.20 || e.keyCode == 40 ){
      calc_final_tpn()
    }
    else
    e.preventDefault();
  });
  $('#tpn_tpn_infusion_attributes_inotrope_infusion').keydown(function(e){ 
    if ( $('#final_tpn_order').text() > 0.20 || e.keyCode == 40 ){
      calc_final_tpn()
    }
    else
    e.preventDefault();
  });
  $('#tpn_tpn_infusion_attributes_other_infusion').keydown(function(e){ 
    if ( $('#final_tpn_order').text() > 0.20 || e.keyCode == 40 ){
      calc_final_tpn()
    }
    else
    e.preventDefault();
  });
  $('#tpn_tpn_infusion_form').submit( function(e) {
    if ($('#final_tpn_order').text() < 0)
  {
    alert('negative tpn not allowed');
    return false;
  }
});
}

function form_load(dates){
  $('#previous_tpn_date').datepicker({ 
    autoclose: true, 
    format: 'dd/mm/yyyy', 
    beforeShowDay: function(date) {
      ymd = ( "0" + date.getDate()).slice(-2) + '/' +  ("0" + (date.getMonth()+1)).slice(-2) + '/' + date.getFullYear();
      if ($.inArray(ymd,dates) < 0) 
        return [true,""];
      else 
        return [true,"red"]; 
    }
  });
}

function getSource() {
  var users = $.map(patients,function(obj){return obj["patient"]})
    return $.map(users, function (user) {
      return {
        id: user['id'],
           name: user['name'],
           toString: function () {
             return JSON.stringify(this);
           },
           toLowerCase: function () {
             return this.name.toLowerCase();
           },
           indexOf: function (string) {
             return String.prototype.indexOf.apply(this.name, arguments);
           },
           replace: function (string) {
             return String.prototype.replace.apply(this.name, arguments);
           }
      };
    });
};

function addTypehead() {
  $('#tpn_patient_name').typeahead({
    minLength: 1,
    source: getSource(),
    display: 'name',
    updater: function (itemString) {
      var item = JSON.parse(itemString);
      $('#tpn_patient_id').val(item.id);
      return item.name;
    }
  });
}

function popover_bind(){
  $('#current_weight_help').popover({ trigger:'hover', placement:'right', content:'Enter The Current body weight of the infant in kg.If the current weight is less than the birth weight, then the birth weight will be taken for calculation.' });
  $('#amino').popover({html: true, placement:'left', content:$('#amino-modal').html()});

  $('#dextrose_conc_help').popover({ trigger:'hover', placement:'right', content:'Enter the expected dextrose concentration(%).Generally 10% dextrose solution is prepared for administration. However individual changes are necessary depending on the patients tolerance. It is recommended that solutions with a dextrose concentration greater than 12.5 % be administered through central line.The normal range for Dextrose concentration of solution is  5-20 %' });
  
  $('#total_fluid_intake_help').popover({ trigger:'hover', html:true, placement:'right', content:'<span><table><tr>Enter the total fluid intake as per patients age and clinical condition.Fluid intake is total amount of fluid that a patient should receive throughout the day. It includes enternal as well as parenteral fluid volumes. The range for fluid intake is as follows- </tr><tr><th></th><th> Fluid Intake </th><th> values </th><th> (ml/kg/day) </th></tr> <tr> <th>Babyy weight(gms) </th> <th>Day(1-2)</th> <th> Day(3-7)</th> <th>Day(8-30)</th></tr><tr><td> <750 </td> <td> 100-200+</td> <td> 150-200+</td> <td> 120-180</td></tr><tr> <td> 750-1000</td> <td> 80-150</td> <td> 100-150 </td> <td> 120-180</td></tr><tr> <td>1001-1500 </td><td>60-100</td><td>80-150</td><td> 120-180</td></tr><tr><td>>1500</td>60-80<td>100-150</td><td>120-180</td></tr></table><span>' });
  
  $('#fat_volume_help').popover({ trigger:'hover', placement:'right', content:'Enter the fat requirement.The broad range of fat requirement for infants and children is 0-4gm/kg/day. Generally fat is initiated at 0.5-1 gm/fg/day and it is graded up gradually by 0.5 gm/kg/day to a maximum of 3.0-4.0gm/kg/day as per tolerance.In certain clinical conditions, administration of fats may be contraindicated. It is advised that you go through standard medical literature before you prescribe fat to the patient.' });
  
  $('#fat_concentration_help').popover({ trigger:'hover', placement:'right', content:'Select Lipid Concentration(%).Lipid concentration indicatethe concentration of the fat or lipid emulsion.fat emulsion are available as 10% and 20%.It is recommended that for VLBW and ELBW infants, the 20% emulsion be used as it has less phospholipid to triglyceride ratio. ' });
  
  $('#factor_help').popover({ trigger:'hover', placement:'right', content:'Enter the Overfill factor for the solution.Overfill factor is a factor that accounts for the losses of fluid that occurs due to wastage during administration.This is usually the fluid that is left behind the IV bottles, tubings and extension sets.This volume is generally 20% therefore overfill factor is taken as 1.2.However it may be modified depending on individual prepared volume(1.3 for smaller volumes and 1.1for larger volumes' });

  $('#amino_acid_help').popover({ trigger:'hover', placement:'right', content:'The normal range for amino acid intake by infants and children is 0.5-3.5 gm/kg/day.Amino acids are generally introduced at 0.5-1 gm/kg/day and is graded up by 0.5-1gm/kg/day as warranted by the clinical condition.Standard medical literature should be referred to before deciding the amino acid requirement of the patient.Providing protien in excess of need may result in hyperammonemia, metabolic acidosis and elevated BUN concentration and may increase the risk of chlolestais.' });

  $('#sodium_chloride_help').popover({ trigger:'hover', placement:'right', content:'The dose should ne decided based on daily requirements, serum eltrolyte values and clinical discretion.Sodium Chloride must be between 0-10.' });

  $('#potassium_chloride_help').popover({ trigger:'hover', placement:'right', content:'The dose should ne decided based on daily requirements, serum eltrolyte values and clinical discretion.Sodium Chloride must be between 0-8.' });
  
  $('#calcium_help').popover({ trigger:'hover', placement:'right', content:'The dose should ne decided based on daily requirements, serum eltrolyte values and clinical discretion.Sodium Chloride must be between 0-10.' });
  
  $('#magnesium_help').popover({ trigger:'hover', placement:'right', content:'The dose should ne decided based on daily requirements, serum eltrolyte values and clinical discretion.Sodium Chloride must be between 0-2.' });
  
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

}
