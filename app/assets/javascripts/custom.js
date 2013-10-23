$(document).ready(function(){

    $('#brand-sort').click(function() {
        $('#home-brands').show();
        $('#home-products').hide()
    });  
    $('#product-sort').click(function(){
        $('#home-brands').hide();
        $('#home-products').show();
    });



    // if ($(window).width() > 991) {
    //      $('.product-grid').mouseenter(function() {
    //         $('.p-hover').fadeTo('fast', 1);
    //         $('#motto').hide()
    //     });  
    //     $('.product-grid').mouseleave(function(){
    //         $('.p-hover').hide();
    //         $('#motto').show();
    //     });
    // }
    // else {
    //     $('.p-hover').hide();
    //     $('#motto').show();
    // }
});

// $('.product-grid').mouseenter(function() {
//             $('.p-hover').fadeTo('fast', 1);
//             $('#motto').fadeTo('fast', 0);
//         });  
//         $('.product-grid').mouseleave(function(){
//             $('.p-hover').fadeTo('fast', 0);
//             $('#motto').fadeTo('fast', 1);