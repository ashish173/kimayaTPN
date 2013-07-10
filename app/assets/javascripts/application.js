//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require bootstrap-typeahead
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require_tree .


$(document).ready(function(){
  $('.alert').alert();
  $('.alert').delay(5000).fadeOut("slow", function () { $(this).remove(); })

});
