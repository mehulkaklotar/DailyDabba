<%-- 
    Document   : orders
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html lang="en-US">
    <head>

        <meta charset="UTF-8">
        <title>Daily Dabba : Admin </title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
        <jsp:include page="commonJs.jsp"></jsp:include>
        <script>
                $(document).ready(function() {

                    $('#ddlType').val($('#ddlType').data('type'));

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

                <!-- breadcrumbs -->
                <div class="container">
                    <ul id="breadcrumbs">
                        <li><a href="dindex.jsp"><i class="icon-home"></i></a></li>
                        <li><a href="AdminController?action=getAllItemsByVendor">Items</a></li>
                        <li><span>Add Item...</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span12">
                        <%
                            if (request.getAttribute("itemList") == null) {
                        %>
                        <form class="form-horizontal" method="post" action="AdminController?action=addItem">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label" for="lblTypeName">Type name:</label>
                                    <div class="controls">
                                        <select name="ddlType" id="ddlType" class="selectStyle">
                                            <option value="Null">Select Type</option>
                                            <option value="Sabzi">Sabzi</option>
                                            <option value="Roti">Roti</option>
                                            <option value="Rice">Rice</option>
                                            <option value="Dal">Dal</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="lblItemName">Item name:</label>
                                    <div class="controls">
                                        <input type="text" id="txtItemName" name="txtItemName" placeholder="Type here...">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Add</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                        <%                            } else {
                        %>
                        <form class="form-horizontal" method="post" action="AdminController?action=updateItem">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label" for="lblTypeName">Type name:</label>
                                    <div class="controls">
                                        <select name="ddlType" data-type="${itemList.type.getTypeName()}" id="ddlType" class="selectStyle">
                                            <option value="Null">Select Type</option>
                                            <option value="Sabzi">Sabzi</option>
                                            <option value="Roti">Roti</option>
                                            <option value="Rice">Rice</option>
                                            <option value="Dal">Dal</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="lblItemName">Item name:</label>
                                    <div class="controls">
                                        <input type="hidden" id="txtItemID" name="txtItemID" value="${itemList.itemID}">
                                        <input type="text" id="txtItemName" name="txtItemName" value="${itemList.itemName}">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Update</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                        <%                             }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_space"></div>
    </div> 

    <!-- footer --> 
    <jsp:include page="footer.jsp"></jsp:include>

        <!-- Common JS -->
    <jsp:include page="commonJs.jsp"></jsp:include>

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
