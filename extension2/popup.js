var millisecondsPerMonth = 1000 * 60 * 60 * 24 * 30,
	  aMonthAgo = (new Date).getTime() - millisecondsPerMonth,
	  numRequestsOutstanding = 0;

chrome.tabs.onUpdated.addListener(function() {
  chrome.history.search({
    'text': '',                // Return every history item...
    'startTime': aMonthAgo,  // accessed less than x time ago.
    'maxResults': 1            // 0 == all results
    },	function(historyItems) {
 
      var url = historyItems[0].url;
      var rootDomain = new URL(url).hostname;
    		console.log(rootDomain);
    		var ms = historyItems[0].lastVisitTime
    		// var min = (ms/1000/60) << 0
      });
   });      				
  


//???
// if (!visitObject[rootDomain]) {
//         visitObject[rootDomain] = {
//           'key'    : rootDomain,
//           'count'  : 1, // this is the total count of all visits across all times
//           'values' : [{'series':rootDomain, 'x': timeOfVisit, 'y':1}],
//         };
//         sortedUrlArray.push(rootDomain);
//       }


// chrome.runtime.onMessage.addListener(
//   function(request, sender, sendResponse) {
//     console.log(sender.tab ?
//                 "from a content script:" + sender.tab.url :
//                 "from the extension");
//     if (request.greeting == "hello")
//       sendResponse({farewell: "goodbye"});
//   });

//   var url,
// 			user_id,
// 			title;


// chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
//     url = tabs[0].url;
//     title = tabs[0].title;
//     $("h3").append(title + " *** " + url)
// });



// chrome.cookies.getAll({url: "http://localhost:3000/"}, function(cookies) {
// 	user_id = parseInt(cookies[0].value)
// 		$.ajax({
// 		  url: "http://localhost:3000/users/" + user_id + "/new_visit.json",
// 		  data: {url: url, user_id: user_id},
// 		  dataType: "json",
// 		  success: function(data) {
// 		  	"success! -- " + data
// 		          			},
// 		  error: function(error) {
// 		    console.log(error);
// 		          			}
// 		});
// 	});

// $("#bookmark").click(function() {
//         	$.ajax({ 
// 		  url: "http://localhost:3000/users/" + user_id + "/bookmarks/new_from_extension.json",
// 		  data: {title: title, url: url, user_id: user_id},
// 		  dataType: "json",
// 		  success: function(data) {
// 		  	"success! -- " + data
// 		          			},
// 		  error: function(error) {
// 		    console.log(error);
// 		          			}
// 		});			
// })

