<%-- 
    Document   : index
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="en-US">
    <head>

        <meta charset="UTF-8">
        <title>DailyDabba</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
        <jsp:include page="commonJs.jsp"></jsp:include>

            <script>

                $(document).ready(function() {
            <% if (session.getAttribute("Role").equals("Admin")) {%>
                    $.ajax({
                        url: "AdminController?action=getTotalOrderNumbers",
                    }).done(function(result) {
                        $('#ordercount').html(result);
                    });

                    $.ajax({
                        url: "AdminController?action=getTotalCustomers",
                    }).done(function(result) {
                        $('#customercount').html(result);
                    });

                    $.ajax({
                        url: "AdminController?action=getTotalVendors",
                    }).done(function(result) {
                        $('#vendorcount').html(result);
                    });

                    $.ajax({
                        url: "AdminController?action=getTotalUsers",
                    }).done(function(result) {
                        $('#usercount').html(result);
                    });
            <% }%>
            <% if (session.getAttribute("Role").equals("Vendor")) {%>
                    $.ajax({
                        url: "AdminController?action=getTotalOrderForVendor",
                    }).done(function(result) {
                        $('#ordercount').html(result);
                    });

                    $.ajax({
                        url: "AdminController?action=getLastMonthOrderForVendor",
                    }).done(function(result) {
                        $('#customercount').html(result);
                    });
                    
                    $.ajax({
                        url: "AdminController?action=getLastWeekOrderForVendor",
                    }).done(function(result) {
                        $('#vendorcount').html(result);
                    });
                    
            <% }%>
                });
        </script>
    </head>
    <body class="bg_d">
        <!-- main wrapper (without footer) -->    
        <div class="main-wrapper">
            <!-- top bar -->
            <jsp:include page="nav.jsp"></jsp:include>
                <!-- header -->
            <jsp:include page="header.jsp"></jsp:include>

                <div style="padding: 20px;"></div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                      
                        <div class="span4">
                            <div class="w-box w-box-green hideable">
                                <div class="w-box-header">
                                    <h4>Analysis</h4>
                                </div>
                                <div class="w-box-content todo-list">

                                    <ul class="connectedSortable">
                                    <% if (session.getAttribute("Role").equals("Admin")) {%>
                                    <li class="high-pr">Order #:<font id="ordercount" style="color: #002a80;font-size: x-large;"></font></li>
                                    <li class="low-pr"> Customer #:<font id="customercount" style="color: #002a80;font-size: x-large;"></font></li>
                                    <li class="low-pr">Vendor #:<font id="vendorcount" style="color: #002a80;font-size: x-large;"></font></li>
                                    <li class="high-pr">Users #:<font id="usercount" style="color: #002a80;font-size: x-large;"></font></li>
                                        <% }%> 
                                        <% if (session.getAttribute("Role").equals("Vendor")) {%>
                                    <li class="high-pr">Order #:<font id="ordercount" style="color: #002a80;font-size: x-large;"></font></li>
                                    <li class="low-pr"> Last Month Order #:<font id="customercount" style="color: #002a80;font-size: x-large;"></font></li>
                                    <li class="low-pr">Last Week Order #:<font id="vendorcount" style="color: #002a80;font-size: x-large;"></font></li>
                                        <% }%> 
                                </ul>

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
