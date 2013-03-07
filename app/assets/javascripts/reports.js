$(document).ready(function() {
  $("#summary").hide();
  if( $("input[name='report[investigation]']:checked").val() == 'summary')
  {
    $("#summary").show();
  }
  $("#report_investigation_last_day").click(function(){
    $("#summary").hide();
  });
  $("#report_investigation_summary").click(function(){
    $("#summary").show();
  });  
  
  $('.datepicker').datepicker({
        autoclose: true,
        format: 'dd/mm/yyyy',
        todayBtn: true
  });
  
  $("#new_report").submit( function () {
    if( $("input[name='report[investigation]']:checked").val() == undefined){
      alert('Please select the report type');
      return false;
    }
    if( $("input[name='report[investigation]']:checked").val() == 'summary'){
      if($('#report_patient').val()==""){
        alert('Patient does not exist .');
          return false;
     }
     return true;
    }
  });

  $('#print').click(function () {
    $('.container .row .span12').jqprint();
  });
});
                  

