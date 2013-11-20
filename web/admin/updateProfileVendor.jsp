<%-- 
    Document   : orders
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>

<%@page import="com.dailydibba.bean.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en-US">
    <head>

        <meta charset="UTF-8">
        <title>Beoro Admin Template v1.2</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>\
            <!-- Common JS -->
        <jsp:include page="commonJs.jsp"></jsp:include>
            <script>
                $(document).ready(function() {
                    var b = new Boolean(true);
                    $('#ddlCity').change(function() {
                        $.ajax({
                            url: "AdminController?action=getAllAreaByCity&cityID=" + $('#ddlCity').val(),
                        }).done(function(result) {
                            $('#areaDiv').html(result);
                        });
                    });

                    $('#ddlCity').val($('#ddlCity').data('city'));
                    $('#ddlArea').val($('#ddlArea').data('area'));

                });
     function checkemail() {
                    if ($('#txtEmailID').val() != "") {
                        var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        if (!pattern.test($('#txtEmailID').val())) {
                            $('#alertEmail').html("Invalid Email");
                            b = false;
                        }
                        else {
                            $('#alertEmail').html("Valid");
                            b = true;
                            return true;
                        }
                    }
                }
                  function checkvendorname() {
                    if ($('#txtVendorname').val() != "") {
                            $('#alertVendorName').html("*");
                            b = false;
                        }
                        else {
                            $('#alertVendorName').html("Required");
                            b = true;
                            return true;
                        }
                    }
                
                  function checkownername() {
                    if ($('#txtOwnername').val() != "") {
                            $('#alertOwnerName').html("*");
                            b = false;
                        }
                        else {
                            $('#alertOwnerName').html("Required");
                            b = true;
                            return true;
                        }
                    }
                     function checkarea() {
                    if ($('#ddlArea').val() != "") {
                            $('#alertOwnerName').html("*");
                            b = false;
                        }
                        else {
                            $('#alertOwnerName').html("Required");
                            b = true;
                            return true;
                        }
                    }
                
                  function checkaddress() {
                    if ($('#txtAddress').val() != "") {
                            $('#alertAddress').html("*");
                            b = false;
                        }
                        else {
                            $('#alertAddress').html("Required");
                            b = true;
                            return true;
                        }
                    }
                    
                      function checklandline() {
                      
                        var pattern = /[0-9]{1,45}$/;
                        if (!pattern.test($('#txtLandlineNumber').val())) {
                            $('#alertLandlineNumber').html("Enter valid number");
                              b = false;
                        }
                        else
                            {
                                if ($('#txtLandlineNumber').val() != "") {
                            $('#alertLandlineNumber').html("*");
                            b = false;
                        }
                        else {
                            $('#alertLandlineNumber').html("Required");
                            b = true;
                            return true;
                        }
                    
                            }
                      }
                    
                
                
                
                function checkmobile() {
                    if ($('#txtMobileNumber').val() != "") {
                        var pattern = /^[789]\d{9}$/;
                        if (!pattern.test($('#txtMobileNumber').val())) {
                            $('#alertMobile').html("Invalid Mobile");
                            b = false;
                        }
                        else {
                            $('#alertMobile').html("Valid");
                            b = true;
                            return true;
                        }
                    }
                }
                
                function updateprofile()
                {
                    if(b)
                        {
                              $.post("Controller?action=updateProfileVendor", {
                                    username: $('#txtUsername').val(),                                 
                                    firstname: $('#txtVendorname').val(),
                                    lastname: $('#txtOwnername').val(),
                                    mobileno: $('#txtMobileNumber').val(),
                                    emailid: $('#txtEmailID').val(),                                   
                                    area: $('#ddlArea').val(),
                                    address: $('#txtAddressVendor').val(),
                                    landline:$('#txtLandlineNumber').val()
                                },
                                function(response) {
                                 
                                    if ($.trim(response) == 'success') {
                                        setTimeout("verification()", 2000);
                                    } else {
                                        alertMessage("error", "Invalid Usename and password!!!");
                                    }
                                });
                                alert("Profile Updated!!");
                        }else
                            {
                                $('#alertupdatevendor').html("Please enter details properly");
                
                            }
                          }
            </script>
        </head>
        <body class="bg_d">
            <!-- main wrapper (without footer) -->    
            <div class="main-wrapper">
                <!-- top bar -->
            <jsp:include page="nav.jsp"></jsp:include>
                <!-- header -->
            <jsp:include page="header.jsp"></jsp:include>

                <!-- breadcrumbs -->
                <div class="container">
                    <ul id="breadcrumbs">
                        <li><a href="AdminController?action=getAdminIndex"><i class="icon-home"></i></a></li>
                        <li><span>Profile Update...</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="w-box">
                                <div class="w-box-header">
                                    <div class="btn-group">
                                        <a href="#" class="btn btn-inverse btn-mini delete_rows_dt" data-tableid="dt_gal" title="Edit">Delete</a>
                                        <a href="#" class="btn btn-inverse btn-mini" title="View">Another Action</a>
                                    </div>
                                </div>
                                <div class="w-box-content">
                                    <form name="updateProfileVendorForm" method="post" action="AdminController?action=updateProfileVendor" id="updateProfileVendor">
                                        
                                        <div align="center" class="row">
                                        <%

                                            Vendor vend = (Vendor) request.getAttribute("Vendor");

                                        %>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>Username:</td>
                                                    <td>
                                                        <div>
                                                            <input readonly="readonly" type="text" id="txtUsername" name="txtUsername" value="<%=vend.getUserName()%>">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Vendor Name:
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <input type="text" style="width:auto;" placeholder="Vendor Name" name="txtVendorname" onkeyup="checkvendorname();" value="<%=vend.getVendorName()%>" >
                                                             <span id="alertVendorName" class="alert">* Required</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Owner Name:</td>
                                                    <td>
                                                        <div>
                                                            <input type="text" style="width:auto;" placeholder="Owner Name" name="txtOwnername" onkeyup="checkownername();" value="<%=vend.getOwnerName()%>">
                                                             <span id="alertOwnerName" class="alert">* Required</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Mobile Number:</td>
                                                    <td>
                                                        <div>
                                                            <input type="text" style="width:auto;" placeholder="Mobile Number" onkeyup="checkmobile();" name="txtMobileNumber" value="<%=vend.getMobileNo()%>">
                                                              <span id="alertMobile" class="alert">Valid mobile no only</span>
                                                             <span style="margin-left: 25px;" class="alert-info">Enter 10 digits only i.e.9090909090 </span>
                               
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Email ID:</td>
                                                    <td>
                                                        <div>
                                                            <input type="text" style="width:auto;" placeholder="Email ID" onkeyup="checkemail();" name="txtEmailID" id="txtEmailID" value="<%=vend.getEmailID()%>">
                                                             <span id="alertEmail" class="alert">Valid Email Address only</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>City:</td>
                                                    <td>
                                                        <select id="ddlCity" name="ddlCity" data-city="<%=vend.getArea().getCity().getCityID()%>" class ="selectStyle">
                                                            <c:forEach items="${Cities}" var="city">

                                                                <option value="${city.cityID}">${city.cityName}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Area</td>
                                                    <td>
                                                        <div name="areaDiv" id="areaDiv">
                                                            <select id="ddlArea" data-area="<%=vend.getArea().getAreaID()%>"  name="ddlArea" class ="selectStyle" onchange="checkarea();">
                                                                <c:forEach items="${Areas}" var="area">

                                                                    <option value="${area.areaID}">${area.areaName}</option>

                                                                </c:forEach>
                                                            </select>
                                                         <span id="alertArea" class="alert">* Required</span>
                     
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Address:</td>
                                                    <td>    
                                                        <div>
                                                            <textarea style="width:300px;" placeholder="Address" id="txtAdressVendor" onkeyup="checkaddress();" name="txtAddressVendor"><%=vend.getLane()%></textarea>           
                                                             <span id="alertAddress" class="alert">* Required</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Landline Number:</td>
                                                    <td>
                                                        <div>
                                                            <input type="text" style="width:auto;" placeholder="Landline Number" onkeyup="checklandline();" name="txtLandlineNumber" id="txtLandlineNumber" value="<%=vend.getLandlineNumber()%>">
                                                        <span id="alertLandlineNumber" class="alert">* Required</span>
                                                        </div>
                                                    </td>
                                                </tr>                          

                                                </div>
                                            <div class="row">
                                                <div class="span6">
                                                    <td colspan="2">
                                                        <input type="submit" value="Update">
                                                    </td>
                                                </div>
                                                </tbody>
                                        </table>
                                    </div>
                                </form>

                            </div>

                            <div class="w-box-footer">
                                <div class="pagination pagination-centered">
                                    <ul>
                                        <li class="disabled"><a href="#">Prev</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer_space"></div>
    </div> 

    <!-- footer --> 
    <jsp:include page="footer.jsp"></jsp:include>



    <!-- Dashboard JS -->
    <!-- jQuery UI -->
    <script src="js/lib/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
    <!-- touch event support for jQuery UI -->
    <script src="js/lib/jquery-ui/jquery.ui.touch-punch.min.js"></script>
    <!-- colorbox -->
    <script src="js/lib/colorbox/jquery.colorbox.min.js"></script>
    <!-- fullcalendar -->
    <script src="js/lib/fullcalendar/fullcalendar.min.js"></script>
    <!-- flot charts -->
    <script src="js/lib/flot-charts/jquery.flot.js"></script>
    <script src="js/lib/flot-charts/jquery.flot.resize.js"></script>
    <script src="js/lib/flot-charts/jquery.flot.pie.js"></script>
    <script src="js/lib/flot-charts/jquery.flot.orderBars.js"></script>
    <script src="js/lib/flot-charts/jquery.flot.tooltip.js"></script>
    <script src="js/lib/flot-charts/jquery.flot.time.js"></script>
    <!-- responsive carousel -->
    <script src="js/lib/carousel/plugin.min.js"></script>
    <!-- responsive image grid -->
    <script src="js/lib/wookmark/jquery.imagesloaded.min.js"></script>
    <script src="js/lib/wookmark/jquery.wookmark.min.js"></script>

    <script src="js/pages/beoro_dashboard.js"></script>

    <script>
                if ($(window).width() > '1280') {
                    $('body').append('<a href="javascript:void" class="fluid_lay" style="position:fixed;top:6px;right:10px;z-index:10000" title="fluid layout"><i class="splashy-arrow_state_grey_left"></i><i class="splashy-arrow_state_grey_right"></i></a>');
                    $('.fluid_lay').click(function() {
                        var url = window.location.href;
                        if (url.indexOf('?') > -1) {
                            url += '&fluid=1'
                        } else {
                            url += '?fluid=1'
                        }
                        window.location.href = url;
                    });
                    $(window).on('resize', function() {
                        if ($(window).width() > '1280') {
                            $('.fluid_lay').show();
                        } else {
                            $('.fluid_lay').hide();
                        }
                    })
                }
    </script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-37020220-1']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>
</body>


</html>
