<%-- 
    Document   : orders
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

            <link rel="stylesheet" href="data-tables/DT_bootstrap.css" />
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
                        <li><a href="AdminController?action=getAllCity">City</a></li>
                        <li><span>View City</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="w-box">
                                <div class="w-box-header">
                                    <div class="btn-group">
                                        <label>City</label>
                                    </div>
                                </div>
                                <div class="w-box-content" style="padding:10px;">
                                    <table class="table table-vam table-striped" id="dt_gal">
                                        <thead>
                                            <tr>


                                                <th width="85%">Name</th>
                                                <th width="15%">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${cities}" var="city">
                                            <tr>


                                                <td><c:out value="${city.cityName}"></c:out></td>
                                                    <td>
                                                        <div class="btn-group">
                                                            <a href="AdminController?action=editCity&cityId=<c:out value="${city.cityID}"></c:out>" class="btn btn-mini" title="Edit"><i class="icon-pencil"></i></a>
                                                            <!--<a href="../Controller?action?viewCity&cityId=" class="btn btn-mini" title="View"><i class="icon-eye-open"></i></a>-->
                                                            <a href="AdminController?action=deleteCity&cityId=<c:out value="${city.cityID}"></c:out>" class="btn btn-mini" title="Delete"><i class="icon-trash"></i></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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

    <!-- Jquery data tables -->

    <script type="text/javascript" src="data-tables/jquery.dataTables.js"></script><!-- For Tables -->
    <script type="text/javascript" src="data-tables/DT_bootstrap.js"></script><!-- For Tables -->
    <script>

        // begin tblEvent table
        $('#dt_gal').dataTable({
            "aoColumns": [{
                    "bSortable": true
                }, null],
            "aLengthMenu": [[5, 15, 20, -1], [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 5,
            "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
            "sPaginationType": "bootstrap",
            "oLanguage": {
                "sLengthMenu": "_MENU_ records per page",
                "oPaginate": {
                    "sPrevious": "Prev",
                    "sNext": "Next"
                }
            },
            "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }]
        });

        jQuery('#dt_gal .group-checkable').change(function() {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function() {
                if (checked) {
                    $(this).attr("checked", true);
                } else {
                    $(this).attr("checked", false);
                }
            });
            jQuery.uniform.update(set);
        });

        jQuery('#dt_gal .dataTables_filter input').addClass("m-wrap medium");
        // modify table search input
        jQuery('#dt_gal .dataTables_length select').addClass("m-wrap small");
        // modify table per page dropdown
        //jQuery('#tblEvent .dataTables_length select').select2(); // initialize select2 dropdown
    </script>
</body>


</html>
