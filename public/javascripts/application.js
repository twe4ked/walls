$(function() {
  $('time.timeago').timeago();
  $('textarea').elastic();
  
  // Auto hide flashes
  setTimeout(function() {
    slideAndHide('.flash');
  }, 4000);
  
  // Hide comments forms on page load
  $('form.comment').hide();
  // Add links for showing comment forms
  $('form.comment').each(function() {
    var form = $(this);
    var link = $('<a href="#">Add comment</a>');
    link.wrap('<p class="comment"></p>').parent().insertBefore(form);
    link.click(function() {
      form.show().find('textarea').focus();
      $(this).hide();
    });
  });
});

// Slide and hide flashes
function slideAndHide(element) {
  $(element).animate({
    opacity: 0
  }, 300, function() {
    $(this).delay(200).animate({
      height: '0',
      padding: '0',
      border: '0'
    }, 300, 'swing', function() {
      $(this).hide();
    });
  });
}