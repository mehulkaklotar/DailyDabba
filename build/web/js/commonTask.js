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


    //Lunch
    $('.sabziLunch').change(function() {

        var sum = 0;

        $('.sabziLunch option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumLunch').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiLunch').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiLunch').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiLunch').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#costLunch').text("* Rs." + sum);
        $('#costLunch').attr("data-price", sum);
        if ($('.txtTiffinQLunch').val() > 0)
        {
            var totalcost = parseFloat($('#costLunch').attr("data-price")) * parseFloat($('.txtTiffinQLunch').val());
            $('#totalcostLunch').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostLunch').text("Rs. " + sum);
        }


    });

    $('.txtQuantityRotiLunch').change(function() {
        var sum = 0;
        var q = parseFloat($(this).val());

        $('.sabziLunch option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumLunch').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiLunch').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiLunch').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiLunch').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });


        $('#costLunch').text("* Rs." + sum);
        $('#costLunch').attr("data-price", sum);
        if ($('.txtTiffinQLunch').val() > 0)
        {
            var totalcost = parseFloat($('#costLunch').attr("data-price")) * parseFloat($('.txtTiffinQLunch').val());
            $('#totalcostLunch').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostLunch').text("Rs. " + sum);
        }
    });

    $('.txtTiffinQLunch').change(function() {

        var sum = 0;

        $('.sabziLunch option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumLunch').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiLunch').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiLunch').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiLunch').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#costLunch').text("* Rs." + sum);
        $('#costLunch').attr("data-price", sum);
        if ($('.txtTiffinQLunch').val() > 0)
        {
            var totalcost = parseFloat($('#costLunch').attr("data-price")) * parseFloat($('.txtTiffinQLunch').val());
            $('#totalcostLunch').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostLunch').text("Rs. " + sum);
        }
    });

    $('#placeorderLunch').click(function() {

        var sabzi = [];
        var c = 0;
        $('.sabziLunch option:selected').each(function() {
            sabzi[c] = parseFloat($(this).val());
            c++;
        });

        if ($('.txtQuantityRotiLunch').val() > 0)
        {
            var rotiQuantity = parseFloat($('.sumRotiLunch').find('td').eq(1).data('quantity')) + parseFloat($('.txtQuantityRotiLunch').val());
        }
        else
        {
            var rotiQuantity = parseFloat($('.sumRotiLunch').find('td').eq(1).data('quantity'));
        }

        if ($('#saladIDLunch').val() > 0)
        {
            var salad = $('#saladIDLunch').val();
        }
        else
        {
            var salad = 0;
        }

        if ($('#txtTiffinQLunch').val() > 0)
        {
            var tiffin = $('#txtTiffinQLunch').val();
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
                $("#errorLunch").html("Please select a sabzi");
                b = false;
                break;
            }
            else
            {
                b = true;
            }
        }

        if (b == true) {
            window.location.href = "Controller?action=preplaceorder&sabzi=" + sabzi + "&roti=" + $('#rotiIDLunch').val() + "&rotiQuantity=" + rotiQuantity + "&rice=" + $('#riceIDLunch').val() + "&dal=" + $('#dalIDLunch').val() + "&salad=" + salad + "&menuID=" + $('#MenuIDLunch').val() + "&tiffin=" + tiffin + "&vendorUN=" + $('#VendorUN').val();
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
    
    
    //Dinner
    $('.sabziDinner').change(function() {

        var sum = 0;

        $('.sabziDinner option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumDinner').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiDinner').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiDinner').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiDinner').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#costDinner').text("* Rs." + sum);
        $('#costDinner').attr("data-price", sum);
        if ($('.txtTiffinQDinner').val() > 0)
        {
            var totalcost = parseFloat($('#costDinner').attr("data-price")) * parseFloat($('.txtTiffinQDinner').val());
            $('#totalcostDinner').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostDinner').text("Rs. " + sum);
        }


    });

    $('.txtQuantityRotiDinner').change(function() {
        var sum = 0;
        var q = parseFloat($(this).val());

        $('.sabziDinner option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumDinner').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiDinner').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiDinner').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiDinner').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });


        $('#costDinner').text("* Rs." + sum);
        $('#costDinner').attr("data-price", sum);
        if ($('.txtTiffinQDinner').val() > 0)
        {
            var totalcost = parseFloat($('#costDinner').attr("data-price")) * parseFloat($('.txtTiffinQDinner').val());
            $('#totalcostDinner').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostDinner').text("Rs. " + sum);
        }
    });

    $('.txtTiffinQDinner').change(function() {

        var sum = 0;

        $('.sabziDinner option:selected').each(function() {
            var q = parseFloat($(this).data('price'));
            sum += q;
        });

        $('.sumDinner').each(function() {
            var p = parseFloat($(this).find('td').data('price'));
            sum += p;
        });

        $('.sumRotiDinner').each(function() {
            var q = parseFloat($(this).find('td').eq(1).data('quantity'));
            if ($('.txtQuantityRotiDinner').val() > 0)
            {
                q = q + parseFloat($('.txtQuantityRotiDinner').val());
            }
            var p = parseFloat($(this).find('td').data('price'));
            var mul;
            mul = p * q;
            sum += mul;
        });

        $('#costDinner').text("* Rs." + sum);
        $('#costDinner').attr("data-price", sum);
        if ($('.txtTiffinQDinner').val() > 0)
        {
            var totalcost = parseFloat($('#costDinner').attr("data-price")) * parseFloat($('.txtTiffinQDinner').val());
            $('#totalcostDinner').text("Rs. " + totalcost);
        }
        else
        {
            $('#totalcostDinner').text("Rs. " + sum);
        }
    });

    $('#placeorderDinner').click(function() {

        var sabzi = [];
        var c = 0;
        $('.sabziDinner option:selected').each(function() {
            sabzi[c] = parseFloat($(this).val());
            c++;
        });

        if ($('.txtQuantityRotiDinner').val() > 0)
        {
            var rotiQuantity = parseFloat($('.sumRotiDinner').find('td').eq(1).data('quantity')) + parseFloat($('.txtQuantityRotiDinner').val());
        }
        else
        {
            var rotiQuantity = parseFloat($('.sumRotiDinner').find('td').eq(1).data('quantity'));
        }

        if ($('#saladIDDinner').val() > 0)
        {
            var salad = $('#saladIDDinner').val();
        }
        else
        {
            var salad = 0;
        }

        if ($('#txtTiffinQDinner').val() > 0)
        {
            var tiffin = $('#txtTiffinQDinner').val();
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
                $("#errorDinner").html("Please select a sabzi");
                b = false;
                break;
            }
            else
            {
                b = true;
            }
        }

        if (b == true) {
            window.location.href = "Controller?action=preplaceorder&sabzi=" + sabzi + "&roti=" + $('#rotiIDDinner').val() + "&rotiQuantity=" + rotiQuantity + "&rice=" + $('#riceIDDinner').val() + "&dal=" + $('#dalIDDinner').val() + "&salad=" + salad + "&menuID=" + $('#MenuIDDinner').val() + "&tiffin=" + tiffin + "&vendorUN=" + $('#VendorUN').val();
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

