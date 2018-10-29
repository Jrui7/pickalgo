$(document).ready(function(){
  $("#campaign_test_type_ab_test").click(function(){
    if($(this).is(':checked'))
    $(".price-part").slideDown();
  })
  $("#campaign_test_type_test_libre").click(function(){
    if($(this).is(':checked'))
    $(".price-part").slideUp();
  })
})


