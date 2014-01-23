$(document).ready(function(){
  $('#click').click(function() {
    $('#shit').hide("fast")
    $('#title').hide("fast")
    $('#crap2').hide("fast")
  });


  $('#social-click').click(function() {
    $('#social-toggle').toggle("fast");
  });

  $('#boob').click(function() {
    $('#shit').show("fast")
    $('#title').show("fast")
    $('#crap2').show("fast")
  });

  $('#brand-sort').click(function() {
    $('#home-brands').show();
    $('#home-products').hide();
    $('.p-hover').hide();

  });
  $('#product-sort').click(function(){
    $('#home-brands').hide();
    $('#home-products').show();
    $('.p-hover').show();
  });

  $('#thumbnail-hide').click(function() {
    $('#p-thumbnails-box').toggle("fast");
    $('#thumbnail-hide').text($('#thumbnail-hide').text() == 'SHOW' ? 'HIDE' : 'SHOW');
  });

  if ($(window).width() > 991) {
    $('#home-products .thumbnail').mouseenter(function() {
      // Hide what's already shown.
      $(".p-hover").not(".p-hover .hidden").addClass("hidden")

      // Find what we should show.
      var productID = $(this).data("product-id");
      var e = $('.p-hover[data-product-id="' + productID +  '"]').removeClass('hidden')
      $('#motto').hide()
    });

    $('#home-products').mouseenter(function() {
    $('.tits').fadeTo('fast', 1);
      });  
    $('#home-products').mouseleave(function(){
      $('.tits').fadeTo('slow',0);
    });
  } 
  else {
    
    $('.p-hover').hide();
    $('#motto').show();
    $('.tits').hide();
  }
});

// $('.product-grid').mouseenter(function() {
//             $('.p-hover').fadeTo('fast', 1);
//             $('#motto').fadeTo('fast', 0);
//         });  
//         $('.product-grid').mouseleave(function(){
//             $('.p-hover').fadeTo('fast', 0);
//             $('#motto').fadeTo('fast', 1);