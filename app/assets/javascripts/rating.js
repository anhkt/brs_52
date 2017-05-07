$(document).on('turbolinks:load', function() {
  $('.rating').on('mouseenter', '.rating-star', function() {
    var index = $(this).data('index');
    for (var i = 1; i<= index; i++) {
      $('.star-' + i).addClass('rate');
    }
    for (var i = index + 1; i<= 5; i++) {
      $('.star-' + i).removeClass('rate');
    }
  });

  $('.rating').on('mouseleave', '.rating-stars', function() {
    var selected = parseInt($('#rating_rating').val()) || 0;
    for (var i = 1; i <= selected; i++) {
      $('.star-' + i).addClass('rate');
    }
    for (var i = selected + 1; i<= 5; i++) {
      $('.star-' + i).removeClass('rate');
    }
  });

  $('.rating').on('click', '.rating-star', function() {
    var selected = parseInt($(this).data('index'));
    $('#rating_rating').val(selected);
    for (var i = selected + 1; i<= 5; i++) {
      $('.star-' + i).removeClass('rate');
    }
    $(this).closest('form').submit();
  });
})
