$(document).ready(function() {
  $('#new_user').on('submit', function(e){
    if ($("#user_terms_of_service").prop('checked')==true) {
      $("#new_user").submit();
    }
    else {
      $(".checkbox-and-text").addClass("shake").css({ 'color': 'red',});
    }
  });
});
