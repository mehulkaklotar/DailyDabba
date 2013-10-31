function addFeedback(vendorName){
    var msg = document.getElementById("message").value
    var rating = document.getElementById("rating").value
    window.location.href = 'Controller?action=addFeedback&vendorUN=' +vendorName+ '&message=' +msg+'&rating='+rating;
}