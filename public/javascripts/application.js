// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
        $(".datepicker").datepicker({dateFormat: 'mm/dd/yy'});
        });

function clearFormErrors() {
    $('.notification-input').remove();

}
