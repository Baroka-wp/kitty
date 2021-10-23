$(document).on('turbolinks:click', function() {
  // show spinner
  $("#spinner").show();
});

$(document).on('turbolinks:load', function() {
  // hide spinner
  $("#spinner").hide();
});

$(document).ready(function() {
   $("#spinner").hide();
   $('button[type="submit"]').click(function() {
     $('#spinner').show();
   });
});
