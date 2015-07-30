
  var url,
		user_id,
		title;

chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
    url = tabs[0].url;
    title = tabs[0].title;
    $("h3").append(title + " *** " + url)
		  chrome.tabs.onActiveChanged.addListener(function() {
				alert("changed")	          				
		  });
});


chrome.cookies.getAll({url: "http://localhost:3000/"}, function(cookies) {
	user_id = parseInt(cookies[0].value)
		$.ajax({
		  url: "http://localhost:3000/users/" + user_id + "/new_visit.json",
		  data: {url: url, user_id: user_id},
		  dataType: "json",
		  success: function(data) {
		  	"success! -- " + data
		          			},
		  error: function(error) {
		    console.log(error);
		          			}
		});
	});

$("#bookmark").click(function() {
        	$.ajax({ 
		  url: "http://localhost:3000/users/" + user_id + "/bookmarks/new_from_extension.json",
		  data: {title: title, url: url, user_id: user_id},
		  dataType: "json",
		  success: function(data) {
		  	"success! -- " + data
		          			},
		  error: function(error) {
		    console.log(error);
		          			}
		});			
})

