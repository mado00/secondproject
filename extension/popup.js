
chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
    url = tabs[0].url;
    $("h3").append(url)
});

chrome.cookies.getAll({url: "*://localhost:3000/*/*"}, function(cookies) {
    for(idx in cookies) {
    	console.log(cookies[idx]);
    }
});