jQuery(document).ready(function($) {

    $(".mobile-nav-trigger button").on("click", function() {
        $("#mobile-nav").toggleClass("active");
    });

    $("#mobile-nav").on("click", ".hasDropDown", function(e) {

        e.preventDefault();

        $("#mobile-nav .hasDropDown").removeClass("active").next().removeClass("active");

        $(this).toggleClass("active");
        $(this).next().toggleClass("active");

    });

});