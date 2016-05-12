jQuery(document).ready(function($) {

  /* MENU */
  $('#bottom-of-header').waypoint(function() {

    $("#secondary-header").toggleClass("active");
    $("#mobile-nav").toggleClass("secondary");

  });

  $('#bottom-of-header').waypoint('enable');

});