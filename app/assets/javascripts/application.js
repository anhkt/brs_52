// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require ckeditor/init
//= require highcharts
//= require highcharts/highcharts-more
//= require_tree .

$(document).on('turbolinks:load', function() {
  set_timetout();

  $('.ckeditor').each(function() {
    CKEDITOR.replace($(this).attr('id'));
  });

  $(document).on('click', 'select#user_book_status', function() {
    if ($(this).val() == 'want_to_read') {
      $(this).val("want_to_read").change()
    }
  });

  $(document).on('change', '#user_book_status', function() {
    $(this).parent().submit();
  });

  if ($('#statistic').length > 0) {
    Highcharts.chart('statistic', {
      chart: {
        type: 'line'
      },
      title: {
        text: 'Statistic about system'
      },
      xAxis: {
        categories: $('#statistic').data('dates')
      },
      yAxis: {
        title: {
          text: 'Number'
        }
      },
      plotOptions: {
        line: {
          dataLabels: {
            enabled: true
          },
          enableMouseTracking: false
        }
      },
      series: [{
        name: 'Review',
        data: $('#statistic').data('reviews')
      }, {
        name: 'Comment',
        data: $('#statistic').data('comments')
      }, {
        name: 'User',
        data: $('#statistic').data('users')
      }]
    });
  }

  $(document).on('click', '#notifications-number', function(e) {
    console.log("a")
    e.preventDefault();
    $.ajax({
      method: "PATCH",
      url: "http://localhost:3000//update_notification/users"
    })
    .done(function() {
      $('.number-noti').remove()
    });
  });

});

function set_timetout() {
  $('.alert').delay(3000).slideUp();
}
