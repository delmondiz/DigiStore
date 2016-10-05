(function ($) {
    $(function () {
        $('.button-collapse').sideNav();
        $('.carousel.carousel-slider').slider();
        $('.carousel').carousel();
        $('.parallax').parallax();
        $('#imgat').materialbox();
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
        });
        $('.dropify').dropify();
        //$('.range-field').range({color:#1565c0});
    }); // end of document ready
})(jQuery); // end of jQuery name space