$(document).ready(function(){
  var form = document.getElementById('new_product');
  if(form) {
    form.addEventListener('submit', function(event) {
       event.preventDefault();
       var photo = $(".attachinary_container").children('input').first();
       if( !$(photo).val() ) {
          $(".chooseFile").addClass("shake").css({ 'color': 'red',});
        }
        else {
          form.submit();
        }
    })
  }

  $(".chooseFile").click(function() {
        $("#product_photos").click();
    });

})



