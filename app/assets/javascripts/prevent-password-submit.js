$(document).ready(function() {
  $('#password-cta').click(function(e){
    if ($('#pro_password').val() == "") {
      e.preventDefault();
      $('#pro_password').addClass('shake').css({ 'color': 'red', 'border-color': 'red' });
    }
  });

  $('#password-cta').click(function(e){
    if ($('#user_password').val() == "") {
      e.preventDefault();
      $('#user_password').addClass('shake').css({ 'color': 'red', 'border-color': 'red' });
    }
  });
});
