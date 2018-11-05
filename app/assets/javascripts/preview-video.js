$(document).ready(function() {

  reload();


  $(".chooseVideo").click(function() {
      $(".video-block").slideToggle();
    });
  videoHandler();
});

function getVideoUrl() {
  var userInput = $("#product_video_url").val();
  return userInput;
}

function clearVideoPreview() {
  $('#iframe').attr('src', '');
  $(".media-preview").addClass('hidden');
}

function parseVideoUrl(videoUrl) {
  var id = videoUrl.replace("https://www.youtube.com/watch?v=", "");
  var url = 'https://www.youtube.com/embed/' + id;
  console.log(url);
  return url;
}

function showVideoPreview(url) {
  $('#iframe').attr('src', url);
  $(".media-preview").removeClass('hidden');
}

function videoHandler() {
  $('#product_video_url').on('keyup', function(event) {
    if (event.keyCode == 86 || event.keyCode == 91) {
      clearVideoPreview();
      var videoUrl = $('#product_video_url').val();
      var videoId = parseVideoUrl(videoUrl);
      showVideoPreview(videoId);
    }

    if (event.keyCode == 8) {
      if ($('#product_video_url').val() == "") {
        clearVideoPreview();
      }
    }
  })
}

function reload() {
  if ($("#product_video_url").val()) {
    var videoInput = $("#product_video_url").val();
    var url = parseVideoUrl(videoInput);
    showVideoPreview(url);
    $(".video-block").slideToggle();
  }
}
