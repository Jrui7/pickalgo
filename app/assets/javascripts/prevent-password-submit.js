$(document).ready(function() {
  $('#password-cta').click(function(e){
    if ($('#pro_password').val() == "") {
      e.preventDefault();
      $('#pro_password').addClass('shake').css({ 'color': 'red', 'border-color': 'red' });
    }
  });
});
