function showVendor() {

    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("vendorList").innerHTML = xmlhttp.responseText;
        }
    }

    var searchString = document.getElementById("txtSearch").value;

    xmlhttp.open("GET", "Controller?action=Search&searchString=" + searchString, true);
    xmlhttp.send();
}

function rate(vendor, customer) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("").innerHTML = xmlhttp.responseText;
        }
    }
    xmlhttp.open("GET", "Controller?action=updateRating&vendor=" + vendor + "&customer=" + customer, true);
    xmlhttp.send();
}

function getAreaCityList() {
    window.location.href = 'Controller?action=getAreaCityList';
}