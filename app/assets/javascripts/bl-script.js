$(document).ready(function(){
     $('.h-pic').mouseenter(function() {
     	$("#heroshot").attr("src", $(this).attr("data-img"))
        $('#heroshot').fadeTo('fast', 1);

        $(".hero-product").html($(this).attr("data-product")).fadeIn();
        $(".hero-brand").html($(this).attr("data-brand")).fadeIn();

        $('#homecaption').hide();
    });
    $('.h-pic').mouseleave(function(){
        $('#heroshot').hide();

        $('#homecaption').show();
        $(".hero-product").hide();
        $('.hero-brand').hide();
    });

  var api_url = "https://api.trycelery.com";
  var products = {};

  var getProduct = function(slug, callback) {
    $.getJSON(api_url + "/v1/products/" + slug + "?callback=?", function(data) {
      callback(data.product);
    })
  }
  var getRevenue = function(slug, callback) {
    $.getJSON(api_url + "/v1/products/" + slug + "/revenue?callback=?", function(data) {
      callback(data.count);
    })
  }
  var getSold = function(slug, callback) {
     $.getJSON(api_url + "/v1/orders/count/" + slug + "?callback=?", function(data) {
      callback(data.count);
    })
  }
  var remainingTime = function(remaining) {
    var str = "";
    if(remaining > 0) {
      var days_until = Math.floor((remaining) / (24 * 3600));
      var hours_until = Math.floor((remaining) / (3600));
      var minutes_until = Math.floor((remaining) / (60));
      var seconds_until = Math.floor((remaining));
      if(days_until > 0) {
        var s = days_until > 1 ? " days": " day";
        str = days_until + s + " to go";
      } else if(hours_until > 0) {
        var s = hours_until > 1 ? " hours": " hour";
        str = hours_until + s + " to go";
      } else if(minutes_until > 0) {
        var s = minutes_until > 1 ? " minutes": " minute";
        str = minutes_until + s + " to go";
      } else if(seconds_until > 0) {
        var s = seconds_until > 1 ? " seconds": " second";
        str = seconds_until + s + " to go";
      }
    }
    return str;
  }

  var displayStuff = function(products) {
  	// debugger
  	for(var key in products) {
  		var product = products[key];
  		// BACKERS ---- product.sold + " of " + product.min + " needed &bull; " + 
    	$("." + key + ".backers-needed").html(Math.floor(product.sold/product.min * 100) + "% funded");
    	$("." + key + ".remaining").html(remainingTime(product.time_remaining/1000));
    }
  }
  
  var getData = function(slugs) {
  	$.each(slugs, function(idx, slug) {
  		if(!products[slug] && slug) {
		    getProduct(slug, function(product) {
		      getSold(slug, function(sold) {
		        getRevenue(slug, function(revenue) {
		          product.sold = sold;
		          product.revenue = revenue
		          products[slug] = product;
				  displayStuff(products);
		        })
		      })
		    })
	   }
	});
  }

  if(typeof(slugs) !== "undefined") {
    getData(slugs.split(","));
  }
});