// if ($(window).width() < 960) {
//     alert('Less than 960');

// }
// else {
//     alert('More than 960');
//     eventFired = 1;
// }

// $(window).on('resize', function() {
//     if (!eventFired) {
//         if ($(window).width() < 960) {
//             alert('Less than 960 resize');
//         } else {
//             alert('More than 960 resize');
//         }
//     }
// });


$(document).ready(function(){
    if ($(window).width() > 991) {
         $('.product-grid').mouseenter(function() {
            $('.p-hover').fadeTo('fast', 1);
            $('#motto').fadeTo('fast', 0);
        });  
        $('.product-grid').mouseleave(function(){
            $('.p-hover').fadeTo('fast', 0);
            $('#motto').fadeTo('fast', 1);
        });
    }
    else {
        $('.p-hover').hide();
        $('#motto').show();
    }
});