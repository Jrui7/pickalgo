

$(document).ready(function(){

  var form = document.querySelector('.edit_product');
  if(form) {
    form.addEventListener('submit', function(event) {
       event.preventDefault();
       var photo = $(".attachinary_container").children('input').first();
       if( !$(photo).val() ) {
          $("#product_photos").addClass("shake").css({ 'color': 'red',});
        }
        else {
          form.submit();
        }
    })
  }
})
