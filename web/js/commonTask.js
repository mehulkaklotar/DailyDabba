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
            sabzi[c] = parseFloat($(this).val());
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

        var b = new Boolean(true);
        for (var i = 0; i < c; i++)
        {
            if (sabzi[i] == 0)
            {
                $("#error").html("Please select a sabzi");
                b = false;
                break;
            }
            else
            {
                b = true;
            }
        }

        if (b == true) {
            window.location.href = "Controller?action=preplaceorder&sabzi=" + sabzi + "&roti=" + $('#rotiID').val() + "&rotiQuantity=" + rotiQuantity + "&rice=" + $('#riceID').val() + "&dal=" + $('#dalID').val() + "&salad=" + salad + "&menuID=" + $('#MenuID').val() + "&tiffin=" + tiffin + "&vendorUN=" + $('#VendorUN').val();
        } else {
            return;
        }


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

function confirmorder()
{
    var a = new Boolean(true);
    var c = new Boolean(true);
    var add = new Boolean(true);
    
    if($('#ddlArea option:selected').val() == 0 && $('#ddlCity option:selected').val() == 0 && $.trim($('#deliveryaddress').val()).length==0){
        $('#alert').html("please provide address details");
    }
    
    if ($('#ddlArea option:selected').val() != 0) {
        var area = $('#ddlArea option:selected').val();
    } else {
        $('#a').html("please select area");
        $('#c').html("");
        $('#add').html("");
        $('#alert').html("");
        a = false;
        return;
    }
    if ($('#ddlCity option:selected').val() != 0) {
        var city = $('#ddlCity option:selected').val();
    } else {
        $('#a').html("");
        $('#c').html("please select city");
        $('#add').html("");
        $('#alert').html("");
        c = false;
        return;
    }
    if ($.trim($('#deliveryaddress').val()).length!=0) {
        var deliveryaddress = $('#deliveryaddress').val();
    } else {
        $('#a').html("");
        $('#c').html("");
        $('#add').html("No value for address");
        $('#alert').html("");
        add = false;
        return;
    }

    var orderID = $('#orderID').val();
    var vendorUN = $('#vendorUN').val();
    var tiffincost = $('#tiffincost').val();
    if (a == true && c == true && add == true) {
        window.location.href = "Controller?action=confirmOrder&orderID=" + orderID + "&area=" + area + "&city=" + city + "&deliveryaddress=" + deliveryaddress + "&vendor=" + vendorUN + "&tiffincost=" + tiffincost;
    }
    else
    {
        return;
    }
}

