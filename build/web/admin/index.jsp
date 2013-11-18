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
        <link rel="icon" type="admin/image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="AdminCommonStyle.jsp"></jsp:include>
        <jsp:include page="AdmincommonJs.jsp"></jsp:include>
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
                        <li><a href="javascript:void(0)"><i class="icon-home"></i></a></li>
                        <li><a href="javascript:void(0)">Content</a></li>
                        <li><a href="javascript:void(0)">Article: Lorem ipsum dolor...</a></li>
                        <li><a href="javascript:void(0)">Comments</a></li>
                        <li><span>Lorem ipsum dolor sit amet...</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span8">
                            <div class="w-box">
                                <div class="w-box-header">
                                    <h4>Analytics</h4>
                                    <i class="icsw16-graph icsw16-white pull-right"></i>
                                </div>
                                <div class="w-box-content cnt_a">
                                    <div class="slidewrap">
                                        <ul class="slider" id="sliderName">
                                            <li class="slide">  
                                                <span class="hide headName">Pageviews</span>
                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div id="ch_pages" class="chart_a"></div>
                                                    </div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="span10 offset1">
                                                        <div class="row-fluid">
                                                            <div class="span4">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 24h<span class="up">+12%</span></p>
                                                                    <p class="anlt_content">2 131</p>
                                                                </div>
                                                            </div>
                                                            <div class="span4">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 7 days<span class="down">-5%</span></p>
                                                                    <p class="anlt_content">14 483</p>
                                                                </div>
                                                            </div>
                                                            <div class="span4">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last Month<span class="up">+14%</span></p>
                                                                    <p class="anlt_content">64 250</p>
                                                                </div>
                                                            </div>  
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="slide">
                                                <span class="hide headName">Users</span>
                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div id="ch_users" class="chart_a"></div>
                                                    </div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="span10 offset1">
                                                        <div class="row-fluid">
                                                            <div class="span6">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 24h<span class="up">+8%</span></p>
                                                                    <p class="anlt_content">184</p>
                                                                </div>
                                                            </div>
                                                            <div class="span6">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 7 days<span class="up">+20%</span></p>
                                                                    <p class="anlt_content">1468</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="slide">
                                                <span class="hide headName">Sales</span>
                                                <div class="row-fluid">
                                                    <div class="span12">
                                                        <div id="ch_sales" class="chart_a"></div>
                                                    </div>
                                                </div>
                                                <div class="row-fluid">
                                                    <div class="span10 offset1">
                                                        <div class="row-fluid">
                                                            <div class="span6">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 24h<span class="up">+20%</span></p>
                                                                    <p class="anlt_content">$1 843</p>
                                                                </div>
                                                            </div>
                                                            <div class="span6">
                                                                <div class="anlt_box">
                                                                    <p class="anlt_heading">Last 7 days<span class="down">-10%</span></p>
                                                                    <p class="anlt_content">$11 638</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="w-box w-box-green hideable">
                                <div class="w-box-header">
                                    <h4>Analysis</h4>
                                </div>
                                <div class="w-box-content todo-list">

                                    <ul class="connectedSortable">
                                        <li class="high-pr">Buy groceries</li>
                                        <li class="low-pr completed"> Do laundry</li>
                                        <li class="low-pr">Meeting with Macy</li>
                                        <li class="high-pr">Pick up kids</li>
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
        <script src="admin/js/lib/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- touch event support for jQuery UI -->
        <script src="admin/js/lib/jquery-ui/jquery.ui.touch-punch.min.js"></script>
        <!-- colorbox -->
        <script src="admin/js/lib/colorbox/jquery.colorbox.min.js"></script>
        <!-- fullcalendar -->
        <script src="admin/js/lib/fullcalendar/fullcalendar.min.js"></script>
        <!-- flot charts -->
        <script src="admin/js/lib/flot-charts/jquery.flot.js"></script>
        <script src="admin/js/lib/flot-charts/jquery.flot.resize.js"></script>
        <script src="admin/js/lib/flot-charts/jquery.flot.pie.js"></script>
        <script src="admin/js/lib/flot-charts/jquery.flot.orderBars.js"></script>
        <script src="admin/js/lib/flot-charts/jquery.flot.tooltip.js"></script>
        <script src="admin/js/lib/flot-charts/jquery.flot.time.js"></script>
        <!-- responsive carousel -->
        <script src="admin/js/lib/carousel/plugin.min.js"></script>
        <!-- responsive image grid -->
        <script src="admin/js/lib/wookmark/jquery.imagesloaded.min.js"></script>
        <script src="admin/js/lib/wookmark/jquery.wookmark.min.js"></script>

        <script src="admin/js/pages/beoro_dashboard.js"></script>

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
