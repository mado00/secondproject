 	var rootDomain,
			user_id,
			ms,
			url,
			time = 604800000;
	 

	 chrome.history.search({
	    'text': '',                // Return every history item...
	    'startTime': time,  // accessed less than x time ago.
	    'maxResults': 1            // 0 == all results
	    },	function(historyItems) {
	      	 url = historyItems[0].url;
	      	  rootDomain = new URL(url).hostname;
	    		var ms_total = historyItems[0].lastVisitTime
	    		    ms = (new Date).getTime() - ms_total
	    			  
document.querySelector("h2").innerHTML = rootDomain
document.querySelector("h4").innerHTML = url

chrome.cookies.getAll({url: "http://localhost:3000/"}, function(cookies) {
	user_id = parseInt(cookies[0].value)
	min = (ms/1000/60) << 0
		$.ajax({
		  url: "http://localhost:3000/users/" + user_id + "/new_visit.json",
		  data: {url: rootDomain, time_amount: min, user_id: user_id},
		  dataType: "json",
		  success: function(data) {
		  	"success! -- " + data
		          			},
		  error: function(error) {
		    console.log(error);
		          			}
		});
	});
});




$("#bookmark").click(function() {
        	$.ajax({ 
		  url: "http://localhost:3000/users/" + user_id + "/bookmarks/new_from_extension.json",
		  data: {title: rootDomain, url: url, user_id: user_id},
		  dataType: "json",
		  success: function(data) {
		  	"success! -- " + data
		          			},
		  error: function(error) {
		    console.log(error);
		          			}
		});			
})

