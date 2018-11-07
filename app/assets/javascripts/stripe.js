$(document).ready(function(){
  $(".has-infos").click(function(){
    var firstName = $("#address_first_name").val();
    var lastName = $("#address_last_name").val();
    var addressStreet = $("#address_street").val();
    var zipCode = $("#address_zip_code").val();
    var city = $("#address_city").val();

    if (firstName != "" && lastName != "" && addressStreet != "" && zipCode != "" && city != "" ) {
      $(this).hide();
      $("#with_customer_id").click();
      $(".loader-container").removeClass("hidden").html("<div class='loader'></div>");

    } else {
      $("#go-to-form").click();
      $("#address-errors").removeClass("hidden");
    }

  })
})
