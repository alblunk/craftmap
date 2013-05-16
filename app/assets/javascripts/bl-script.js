$(document).ready(function(){
     $('.h-pic').mouseenter(function() {
        $('#heroshot').fadeTo('fast', 1);
    });
    $('.h-pic').mouseleave(function(){
        $('#heroshot').hide();
    });
});