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
//= require_tree .

// $(function() {

//   $('body').on('mouseenter', function(e){
//     e.preventDefault;
//     console.log("clicked!");
//     $('#full-width-img').fadeIn('slow', function(){
//       $(this).delay(5000);
//     })
//   });

// });
	$(function(){
  	$('#newBookmark').click(function(e) {
			e.preventDefault();

$(document).ready(function(){
    //Handles menu drop down
    // $('#modal').find('form').click(function (e) {
    //     e.stopPropagation();
    // });
});


    var html = '<br><form id="newWineform" action="javascript:void(0)">' +
               '<div class="form-group">' + 
                //put on two lines, one for label and one for input
               '<label for="varietal">Name: </label><input type="text" class="form-control" name="varietal" id="varietal" autofocus>' +
               '</div>' +
               '<div class="form-group">' +
               '<label for="vintage">URL: </label>' +
               '<input type="number" class="form-control" name="vintage" id="vintage" autofocus>' +
               '</div>' +
               '<label for="winery">Anything: </label>' +
               '<input type="text" class="form-control" name="winery" id="winery" autofocus>' +
               '</div>' +
               '<br><input type="submit" value="Search" class="btn btn-default btn-xl page-scroll">' +
               '</form>';

    $('#searchResults').after(html);

  //   $('#newWineform').submit(function(e) {
  //     e.preventDefault();
})
	
		$('#searchButton').click(function(e){
			$('#searchResults').remove()
		});


})

