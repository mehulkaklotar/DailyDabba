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

        $('.sabzi option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sum').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRoti').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRoti').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRoti').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#cost').text("* Rs." + sum);
        $('#cost').attr("data-price", sum);
        if ($('.txtTiffinQ').val() > 0)
        {
            var totalcost = parseFloat($('#cost').attr("data-price")) * parseFloat($('.txtTiffinQ').val());
            $('#totalcost').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcost').text("Rs. " + sum);
        }


    });

    $('.txtQuantityRoti').change(function() {
        var sum = 0;
        var q = parseFloat($(this).val());

        $('.sabzi option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sum').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRoti').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRoti').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRoti').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });


        $('#cost').text("* Rs." + sum);
        $('#cost').attr("data-price", sum);
        if ($('.txtTiffinQ').val() > 0)
        {
            var totalcost = parseFloat($('#cost').attr("data-price")) * parseFloat($('.txtTiffinQ').val());
            $('#totalcost').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcost').text("Rs. " + sum);
        }
    });

    $('.txtTiffinQ').change(function() {

        var sum = 0;

        $('.sabzi option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sum').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRoti').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRoti').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRoti').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#cost').text("* Rs." + sum);
        $('#cost').attr("data-price", sum);
        if ($('.txtTiffinQ').val() > 0)
        {
            var totalcost = parseFloat($('#cost').attr("data-price")) * parseFloat($('.txtTiffinQ').val());
            $('#totalcost').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcost').text("Rs. " + sum);
        }
    });

    $('#placeorder').click(function() {

        var sabzi = [];
        var c = 0;
        $('.sabzi option:selected').each(function() {
            if ($(this).val() == 0)
            {
                return false;
            }
            else
            {
                sabzi[c] = parseFloat($(this).val());
            }
            c++;
        });

        if ($('.txtQuantityRoti').val() > 0)
        {
            var rotiQuantity = parseFloat($('.sumRoti').find('td').eq(1).data('quantity')) + parseFloat($('.txtQuantityRoti').val());
        }
        else
        {
            var rotiQuantity = parseFloat($('.sumRoti').find('td').eq(1).data('quantity'));
        }

        if ($('#saladID').val() > 0)
        {
            var salad = $('#saladID').val();
        }
        else
        {
            var salad = 0;
        }

        if ($('#txtTiffinQ').val() > 0)
        {
            var tiffin = $('#txtTiffinQ').val();
        }
        else
        {
            var tiffin = 1;
        }

        //alert("Controller?action=preplaceorder&sabzi="+sabzi+"&roti="+$('#rotiID').val()+"&rotiQuantity="+rotiQuantity+"&rice="+$('#riceID').val()+"&dal="+$('#dalID').val()+"&salad="+salad+"&menuID="+$('#MenuID').val()+"&tiffin="+tiffin+"&vendorUN="+$('#VendorUN').val());
        window.location.href="Controller?action=preplaceorder&sabzi="+sabzi+"&roti="+$('#rotiID').val()+"&rotiQuantity="+rotiQuantity+"&rice="+$('#riceID').val()+"&dal="+$('#dalID').val()+"&salad="+salad+"&menuID="+$('#MenuID').val()+"&tiffin="+tiffin+"&vendorUN="+$('#VendorUN').val();

        /*$.post("Controller?action=preplaceorder", {
            sabzi: sabzi,
            roti: $('#rotiID').val(),
            rotiQuantity: rotiQuantity,
            rice: $('#riceID').val(),
            dal: $('#dalID').val(),
            salad: salad,
            menuID: $('#MenuID').val(),
            tiffin: tiffin,
            vendorUN: $('#VendorUN').val()
        });*/
        
    });

});

