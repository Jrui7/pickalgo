$(document).ready(function() {
  $('#new_user').on('submit', function(e){
    if ($("#user_terms_of_service").prop('checked')==true) {
      $("#new_user").submit();
    }
    else {
      $(".checkbox-and-text").addClass("shake").css({ 'color': 'red',});
    }
  });


  $("#open-cta").click(function(event){
    if(!$("#pick_price").val()) {
       event.preventDefault();
       $("#pick_price").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
     }

     if( ($('#pick_size').length) && (!$("#pick_size").val()) ) {
        event.preventDefault();
        $("#pick_size").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
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

     if( ($('#pick_size').length) && (!$("#pick_size").val()) ) {
        event.preventDefault();
        $("#pick_size").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
      }

     else {
       form.submit();
     }

  })

});
