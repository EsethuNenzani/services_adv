// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery.min
//= require rails-ujs
//= require_tree .

$(document).ready(function() {

    var slider = new MasterSlider();

    slider.setup('masterslider' , {
        width:1920,
        height:380,
        space:0,
        layout:'fullwidth',
        loop:true,
        preload:0,
        autoplay:true,
        view:'fade',
        overPause:false
    });
    slider.control('arrows');

    $('#lightgallery').lightGallery({
        selector: '.item',
        thumbnail:true
    });

    $('.single_image').lightGallery({
        selector: '.item',
        thumbnail:false
    });
});

$(window).load(function() {

    var $container = $('.gallery-isotope');
    $container.isotope({
        filter : ".gallery-item",
        layoutMode: 'masonry'

    });
});