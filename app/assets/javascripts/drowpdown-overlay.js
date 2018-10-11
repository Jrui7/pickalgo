$(document).ready(function(){
  $(".right-links-menu").click(function(){
    $(".overlay").css({ 'height': '100%',});
  })

  $(".closebtn").click(function(){
    $(".overlay").css({ 'height': '0%',});
  })

})
