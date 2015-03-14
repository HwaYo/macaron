$(document).ready(function() {
  $(".gifts").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: ".gifts div.gift-card"
  });

  $('#recommend').on('click', function() {
    jQuery('.gifts').infinitescroll('retrieve');
  });
  
});