$(function() {
  $('time.timeago').timeago();
  $('textarea').elastic();
});

$(function() {
  $('form.comment').hide();
  $('form.comment').each(function()
  {
    var form = $(this);
    var link = $('<a href="#">Add comment</a>');
    link.wrap('<p class="comment"></p>').parent().insertBefore(form);
    link.click(function()
    {
      form.show().find('textarea').focus();
      $(this).hide();
    });
  });
});
