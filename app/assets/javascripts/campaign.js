$(document).ready(function(){
  $("#campaign_test_type_ab_test").click(function(){
    if($(this).is(':checked'))
    $(".open-part").slideUp();
    $(".price-part").slideDown();
  })
  $("#campaign_test_type_test_ouvert").click(function(){
    if($(this).is(':checked'))
    $(".price-part").slideUp();
    $(".open-part").slideDown();
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

  $('#new_campaign').on('submit', function(e){
    if($("#campaign_test_type_ab_test").is(':checked'))
    var price = $("#campaign_price_1").val();
    var priceTwo = $("#campaign_price_2").val();
      if (price == "" && priceTwo == "") {
        $("#campaign_price_1").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
        $("#campaign_price_2").addClass("shake").css({ 'color': 'red', 'border-color': 'red' });
        return false;
      }

    });

})


