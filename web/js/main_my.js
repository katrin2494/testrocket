jQuery(document).ready(function () {
    var navbar = jQuery('.navbar-fixed-top');

    jQuery(window).scroll(function () {
        if(jQuery(window).scrollTop()>navbar.outerHeight()){
            navbar.addClass('scrolled');
        }else{
            navbar.removeClass('scrolled');
        }
    });
});
