$(document).ready(function(){
  $(".form-choice").click(function(){
    $(".form-choice").toggleClass("active");
  });

  $(".size-radio-input").click(function(){
    $(".size-radio-input").removeClass("active");
    $(this).toggleClass("active");
  });
});
