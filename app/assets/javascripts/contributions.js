$(document).on('ready page:load', function () {
  $('button[data-amount]').on('click', function () {
    var selected_amount = $(this).data('amount');
    var remain_amount = $("#contribution_form_amount").attr("max");
    $("#contribution_form_amount").val(Math.min(selected_amount, remain_amount));
  });
});