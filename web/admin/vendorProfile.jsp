<%-- 
    Document   : vendorProfile
    Created on : Nov 16, 2013, 7:23:05 PM
    Author     : Vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en-US">
    <head>

        <meta charset="UTF-8">
        <title>Daily Dabba : Admin </title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
            <!-- Common JS -->
        <jsp:include page="commonJs.jsp"></jsp:include>
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
                        <li><a href="dindex.jsp"><i class="icon-home"></i></a></li>
                        <li><a href="AdminController?action=getAllVendors">Vendor</a></li>
                        <li><span>View Profile...</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="w-box">
                                <div class="w-box-header">
                                    <h4>Vendor profile</h4>
                                </div>
                                <div class="w-box-content cnt_a user_profile">
                                    <div class="row-fluid">
                                        <div class="span2">
                                            <div class="img-holder">
                                                <img class="img-avatar" alt="" src="img/avatars/avatar.png">
                                                <!--<center><input type="button" name="btnBlock" class ="btn-beoro-3" value="Block" ></center>-->
                                            </div>
                                        </div>
                                        <div class="span10">
                                            <p class="formSep"><small class="muted">Verified:</small> <span class="label label-success">
                                                <c:choose>
                                                <c:when test="${vendor.isStatus()==true}">
                                                    Yes
                                                </c:when>
                                                <c:otherwise>
                                                    No                                                        
                                                </c:otherwise>
                                            </c:choose>
                                            </span></p>
                                            <p class="formSep"><small class="muted">Username:</small> ${vendor.getUserName()}</p>
                                        <p class="formSep"><small class="muted">Name:</small> ${vendor.getVendorName()}</p>
                                        <p class="formSep"><small class="muted">Owner Name:</small> ${vendor.ownerName}</p>
                                        <p class="formSep"><small class="muted">Mobile No:</small> ${vendor.mobileNo}</p>
                                        <p class="formSep"><small class="muted">Email:</small> ${vendor.emailID}</p>
                                        <p class="formSep"><small class="muted">Landline No:</small> ${vendor.landlineNumber}</p>
                                        <p class="formSep"><small class="muted">Lane:</small> ${vendor.lane}</p>
                                        <p class="formSep"><small class="muted">Area:</small> ${vendor.getArea().getAreaName()}</p>
                                        <p class="formSep"><small class="muted">City:</small> ${vendor.getArea().getCity().getCityName()}</p>
                                        
                                        <p class="formSep"><small class="muted">Provides Customizable menu:</small> <c:choose>
                                                <c:when test="${vendor.isFlag() == true}">
                                                    Yes
                                                </c:when>
                                                <c:otherwise>
                                                    No                                                        
                                                </c:otherwise>
                                            </c:choose></p></p>
                                        <p class="formSep"><small class="muted">Service Available At:</small> 
                                            <c:forEach items="${areas}" var="area">
                                               <br/> ${area.AreaName} 
                                            </c:forEach></p>                            
                                    </div>
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
