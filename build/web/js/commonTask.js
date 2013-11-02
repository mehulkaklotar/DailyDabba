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



$(document).ready(function() {

    $('#ddlCity').change(function() {
        $.ajax({
            url: "Controller?action=getAllCityArea&cityID=" + $('#ddlCity').val(),
        }).done(function(result) {
            $('#areaDiv').html(result);
        });
    });

    $('.sabzi').change(function() {
        
        var sum = 0;
        
        $('.sabzi').each( function(){
            
            var q = parseFloat($(this).val());
            sum += q;
        });
        
         $('.sum').each(function() {
             var p = parseFloat($(this).find('td').data('price'));
             sum += p;
         });
         
         $('.sumRoti').each(function() {
             var q = parseFloat($(this).find('td').eq(1).data('quantity'));
             var p = parseFloat($(this).find('td').data('price'));
             var mul;
             mul = p * q;
             sum += mul;
         });
         
          $('#cost').text("* Rs."+sum);
          $('#cost').attr("price",sum);
          //$('#cost').data('price').val(sum);
          $('#totalcost').text("Rs. "+sum);
        
    });
    
    $('.txtQuantityRoti').change(function (){
        var sum = 0;
        var q = parseFloat($(this).val());
         $('.sabzi').each( function(){
            
            var q = parseFloat($(this).val());
            sum += q;
        });
        
         $('.sum').each(function() {
             var p = parseFloat($(this).find('td').data('price'));
             sum += p;
         });
         
         $('.sumRoti').each(function() {
             var q = parseFloat($(this).find('td').eq(1).data('quantity'));
             q = q + parseFloat($('.txtQuantityRoti').val());
             var p = parseFloat($(this).find('td').data('price'));
             var mul;
             mul = p * q;
             sum += mul;
         });
        
        
        $('#cost').text("* Rs."+sum);
        $('#totalcost').text("Rs. "+sum);
    });

    $('.txtTiffinQ').change(function (){
        
        var sum = 0;
        
        $('.sabzi').each( function(){
            
            var q = parseFloat($(this).val());
            sum += q;
        });
        
         $('.sum').each(function() {
             var p = parseFloat($(this).find('td').data('price'));
             sum += p;
         });
         
         $('.sumRoti').each(function() {
             var q = parseFloat($(this).find('td').eq(1).data('quantity'));
             var p = parseFloat($(this).find('td').data('price'));
             var mul;
             mul = p * q;
             sum += mul;
         });
        
        var q = parseFloat($(this).val()); 
        var mul = sum * q;
        $('#totalcost').text("Rs. "+mul);
    });

});
