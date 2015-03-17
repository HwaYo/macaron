$(document).on('ready page:load', function(){
  var friend_cell = $(".friend");

  $("#search").keyup(function() {
      var val = $.trim(this.value).toUpperCase();
      if (val === "")
          friend_cell.show();
      else {
          friend_cell.hide();
          friend_cell.filter(function() {
              return -1 != $(this).text().toUpperCase().indexOf(val); }).show();
      }
  });
});

