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

  $('.toTop').click(function () {
     // console.log('in')
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
  });

  // logo section hide and show 
  $("#search-btn").click(function(event){
    event.preventDefault();
    // $('#result').remove()
    $.ajax({ type: "GET",
          url:"/searches/index",
          dataType: "json",
          data: $("#search_form").serialize(),
          success: function(searches) {
            var html = "";
            searches.forEach(function(search) {
              search_url = search.url
              results = search.results
              results.forEach(function(result){
                name = result.name
                url = result.url
                description = result.description
                html = '<ul class="list-unstyled col-sm-12"><li class="col-sm-1"><a href="#" id="login" class="navbar-brand" data-toggle="modal" data-target="#modal_login"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></a></li><li class="search-title col-sm-11"><h4>' + '<a href="' + url + '">' + name + '</a></h4></li> ' + '<li class="col-sm-12"><p>' + description + '</p></li></ul>' + html
              })
              html = "<h2><strong>" + search_url + "</strong></h2>" + html
            })

            $("#result").html(html);
          }
    });
    $('#full-width-img').hide();
  });
  //   $("#search-btn").click(function(){
  //       $('#full-width-img').show();
  //    });
  
})

