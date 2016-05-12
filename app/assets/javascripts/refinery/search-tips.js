jQuery(document).ready(function($) {

  $('.search-tips-show').on('click', function() {
    
    $('.search-tips').slideToggle();
    if ($('.search-tips-show').html() == "show") {
      $('.search-tips-show').html('hide');
    } else {
      $('.search-tips-show').html('show');
    }
    
  });

});