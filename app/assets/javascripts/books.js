$(document).on('turbolinks:load', function() {
  $('.show-more').click(function() {
    if ($(this).parent().hasClass('hidden')) {
      $(this).parent().siblings().addClass('hidden');
      $(this).parent().removeClass('hidden');
    } else {
      $(this).parent().siblings().removeClass('hidden');
      $(this).parent().addClass('hidden');
    }
  })

  $('.show-less').click(function() {
    if ($(this).parent().hasClass('hidden')) {
      $(this).parent().siblings().addClass('hidden');
      $(this).parent().removeClass('hidden');
    } else {
      $(this).parent().siblings().removeClass('hidden');
      $(this).parent().addClass('hidden');
    }
  })
})
