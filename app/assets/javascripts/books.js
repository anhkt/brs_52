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

  $('form').on('click', '.remove_fields', function(event) {
    $(this).closest('.field').remove();
    event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
})
