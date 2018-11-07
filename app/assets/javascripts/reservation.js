$(document).ready(function(){
  $(".new-card").click(function(){
    $(".registered-card").slideUp();
    $(".display-card").removeClass("yellow");
    $(".update-card").slideToggle();
  })
  $(".first-card").click(function(){
    if (!$(this).hasClass( "yellow" )) {
      $(this).addClass("yellow");
      $(".update-card").slideToggle();
      $(".registered-card").slideDown();
    }
  })
})
