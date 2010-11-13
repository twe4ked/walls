// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $('.formtastic.comment').hide();
  
  $('a.reply').click(function() {
    var status_id = $(this).attr('id')
    $('#new_comment_status_' + status_id).show();
  });
  
});