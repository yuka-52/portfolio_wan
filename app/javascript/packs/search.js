$(document).on('turbolinks:load', function() {
  $('.mini_image').click(function () {
    var $src = $(this).attr('src');
    $('.searchshow_image').attr('src', $src);
  });
});

$(document).on('turbolinks:load', function() {
  $('.mini_image').click(function () {
    var $src = $(this).attr('src');
    $('.protectionshow_image').attr('src', $src);
  });
});
$(document).on('turbolinks:load', function() {
  $('.mini_image').click(function () {
    var $src = $(this).attr('src');
    $('.sight_image').attr('src', $src);
  });
});
