// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require wow
//= require_tree .


$(document).ready(function() {

	// $('#search-btn').click(function () {
	//     // console.log('in')
	//      $('body,html').animate({
	//        scrollTop: $('#all-search-results')
	//      }, 800);
	//      return false;
	//  });
	

	$('.toTop').click(function () {
	    // console.log('in')
	     $('body,html').animate({
	       scrollTop: 0
	     }, 800);
	     return false;
	 });


		$("#star-btn").click(function(e){
	
		  
			// $('#full-width-img').addClass("display");

		   // $('body,html').animate({
	    //    			scrollTop: 400
	    // 				 }, 50);
	     				// return false;
	     			});



	// logo section hide and show 
	 // $("#search-btn").click(function(event){
	 //   // event.preventDefault();

	 //   $.ajax({ type: "GET",
	 //         url:"/searches/index",
	 //         dataType: "json",
	 //         data: $("#search_form").serialize(),
	 //         success: function(searches) { 
	 //           var html = "";
	 //           searches.forEach(function(search) {
	 //             search_url = search.url
	 //             results = search.results
	 //             results.forEach(function(result){
	 //               name = result.name
	 //               url = result.url
	 //               description = result.description
	 //               html = '<ul class="list-unstyled col-sm-12"><li class="col-sm-1"><a href="#" id="login" class="navbar-brand" data-toggle="modal" data-target="#modal_login"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li><li class="search-title col-sm-11"><h4>' + '<a href="' + url + '">' + name + '</a></h4></li> ' + '<li class="col-sm-12"><p>' + description + '</p></li></ul>' + html
	 //             })
	 //             html = "<h2><strong>" + search_url + "</strong></h2>" + html
	 //           })

	 //           $("#result").html(html);
	           
	         
	 //         }
	       
	 // 			});

	 //   });
	 //   $('#full-width-img').hide();
	   // $('body,html').animate({
	   //     			scrollTop: $('#all-search-results').offset().top
	   //  				 }, 500);
	   //   				return false;
	 });










