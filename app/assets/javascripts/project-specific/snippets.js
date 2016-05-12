jQuery(document).ready(function($) {

  /* CALCULATING WIDTHS FOR BG IMAGE PLACEMENT ON CATEGORIES ACCORDION */

  var contentWidth = $('#categories-show > p').width();

  $('#categories-show dt').width(contentWidth);
  $('#categories-show dd').width(contentWidth - 50);

  $('.back-button').on('click', function() {
    window.history.back();
  });

  /* SLIDE DOWN FOR UPDATES ON MOBILE */

  $('.latest-updates-header--mobile').on('click', function() {

    $('#latest-updates-sidebar').slideToggle();

    $(this).toggleClass('shown');

  });

  /* ADD DROPDOWN CLASS IF HAS DROPDOWN */

  $(".primary-nav a").each( function() {
    if ( $(this).siblings("ul").length ) {
      $(this).addClass("hasDropDown");
    }
  });

  /* DISABLE CLICK ON TOOLS & RESOURCES IN NAVBAR */

  $('.primary-nav ul li a').on('click', function(e) {

    if ($(this).hasClass('hasDropDown')) {
       e.preventDefault();
    }
  });

  /* FIND RESOURCE FROM LATEST UPDATES SIDEBAR CLICK */

  function resourceID(id) {
    $('html, body').animate({
      scrollTop: ($('#' + id).offset().top - 95)
    });

    $('#' + id).addClass('shown');
    $('#' + id + '> .accordion-title').trigger('click').addClass('shown');
  }

  if (location.search.indexOf("id") > 0) {
    resourceID(location.search.replace("?id=", ""));
  }

});