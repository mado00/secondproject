
  var url,
		user_id;



chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
    url = tabs[0].url;
    title = tabs[0].title;
    $("h3").append(title + " *** " + url)
    console.log(this, "wtf");
    console.log(tabs);
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

