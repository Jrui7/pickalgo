$(document).ready(function() {
  $('#new_user').on('submit', function(e){
    if ($("#user_terms_of_service").prop('checked')==true) {
      $("#new_user").submit();
    }
    else {
      $(".checkbox-and-text").addClass("shake").css({ 'color': 'red',});
    }
  });


  $("#save-cta").click(function(event){
    if(!$("#pick_price").val()) {
       event.preventDefault();
       $(".participation-input").addClass("shake");
     }
     else {
       form.submit();
     }

  })

  $("#ab-cta").click(function(event){
    if( ($("#pick_answer_yes").prop('checked')==false) && ($("#pick_answer_no").prop('checked')==false)  ) {
       event.preventDefault();
       $(".participation-input").addClass("shake");
     }
     else {
       form.submit();
     }

  })

});
