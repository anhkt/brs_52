$(document).on('turbolinks:load', function() {
  if ($('.td-categories-show').length) {
    let data_id = $('.td-categories-show').data('id');
    let div_class = '.category-' + data_id;
    $(div_class).addClass('active');
  }
})
