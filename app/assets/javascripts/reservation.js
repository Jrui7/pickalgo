$(document).ready(function(){
  $(".new-card").click(function(){
    $(".registered-card").slideUp();
    $(".display-card").removeClass("yellow");
    $(".update-card").slideToggle();
  })
})
