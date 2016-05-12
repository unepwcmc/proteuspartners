jQuery(document).ready(function($) {


  $("#latest-updates-sidebar dl.accordion").find("dd").hide();
  $(".accordion li > dl").hide();

  $("dl.accordion").on("click", "dt", function() {

    // Get parent accordion
    var parent = $(this).parents(".accordion");

    if ( $(this).children().hasClass("shown") ) {
      // Hide all the relevant items
      $(this).children().toggleClass("shown");
      $(this).next().toggleClass("shown");
      $(this).next().slideToggle();

    } else {

      // Hide all items
      $(".accordion dt").children().removeClass("shown");
      $(".accordion dt").next().toggleClass("shown");
      $(".accordion dt").next().slideUp();

      // Show all the relevant items
      $(this).children().toggleClass("shown");
      $(this).next().toggleClass("shown");
      $(this).next().slideToggle();

    }
      
  });

  $(".accordion").on("click", ".sub-category-title", function() {

    if ( $(this).hasClass("shown") ) {

      // Hide all the relevant items
      $(this).parent().toggleClass("shown");
      $(this).toggleClass("shown");
      $(this).next().slideToggle();

    } else {

      // Hide all items
      $(".accordion .sub-category-title").parent().removeClass("shown");
      $(".accordion .sub-category-title").removeClass("shown");
      $(".accordion .sub-category-title").next().slideUp();

      // Show all the relevant items
      $(this).toggleClass("shown");
      $(this).parent().toggleClass("shown");
      $(this).next().slideToggle();

    }
      
  });

});