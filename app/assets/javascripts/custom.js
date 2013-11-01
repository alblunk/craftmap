$(document).ready(function(){

  $('#brand-sort').click(function() {
    $('#home-brands').show();
    $('#home-products').hide()
  });
  $('#product-sort').click(function(){
    $('#home-brands').hide();
    $('#home-products').show();
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
    $('#home-products .thumbnail').mouseenter(function() {
  }
  else {
    $('.p-hover').hide();
    $('#motto').show();
  }
});

// $('.product-grid').mouseenter(function() {
//             $('.p-hover').fadeTo('fast', 1);
//             $('#motto').fadeTo('fast', 0);
//         });  
//         $('.product-grid').mouseleave(function(){
//             $('.p-hover').fadeTo('fast', 0);
//             $('#motto').fadeTo('fast', 1);