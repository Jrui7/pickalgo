$(document).ready(function(){
  $("#campaign_test_type_ab_test").click(function(){
    if($(this).is(':checked'))
    $(".price-part").slideDown();
  })
  $("#campaign_test_type_test_ouvert").click(function(){
    if($(this).is(':checked'))
    $(".price-part").slideUp();
  })

  $(".test-title-box").click(function(){
    $(".explaination").slideToggle();
  })

  $("#pick_answer_yes").click(function(){
    if($(this).is(':checked'))
      if($('.no-outcome').is(':visible'))
      {
        $(".no-outcome").slideUp();
      }
    $(".yes-outcome").slideDown();
  })

  $("#pick_answer_no").click(function(){
    if($(this).is(':checked'))
      if($('.yes-outcome').is(':visible'))
      {
        $(".yes-outcome").slideUp();
      }
    $(".no-outcome").slideDown();
  })





})


