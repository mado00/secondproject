
chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
    url = tabs[0].url;
    $("h3").append(url)
   


    //send post request (user) - 
});



