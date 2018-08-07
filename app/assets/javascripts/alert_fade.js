// Notifications / Alerts fadeout
// $(document).ready(function(){
// Page reload with turbolinks: Document ready does not always run, so:
$(document).on('turbolinks:load', function () {
  $(".alert").delay(3000).fadeOut(1000);
}); 
