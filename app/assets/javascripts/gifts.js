$(document).on('ready page:load', function() {
  $(".gifts").infinitescroll({
    navSelector: "nav.pagination",
    nextSelector: "nav.pagination a[rel=next]",
    itemSelector: ".gifts div.gift-card"
  });

  $(window).unbind('.infscr');

  $('nav.pagination').on('click', function() {
    $(document).trigger('retrieve.infscr');
    return false;
  });

  $(document).ajaxError(function(e,xhr,opt) {
    if(xhr.status==404)
      $('nav.pagination').remove();
  });

  $('#recommend').on('click', function() {
    $('.gifts').infinitescroll('retrieve');
  });

  $('#gifts-container').on('click', '[data-target="#new-fund"]',function() {
    var data = {
      friend_id: $(this).data("friend-id"),
      gift_id: $(this).data("gift-id")
    };
    $.ajax({
      url: "/funds/new",
      data: data
    }).done(function(result) {
      $('#new-fund-body').html(result);
    });
  });
});