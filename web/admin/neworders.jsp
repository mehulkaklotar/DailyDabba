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
        <title>Beoro Admin Template v1.2</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
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
                    <li><a href="javascript:void(0)">Orders</a></li>
                    <li><a href="javascript:void(0)">New Orders...</a></li>
                </ul>
            </div>
            
        <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        
                        <div class="w-box w-box-blue">
                            <div class="w-box-header">
                                Orders to be delivered
                            </div>
                            <div class="w-box-content cnt_a">
                                
                                <table id="table-stacking-simple" class="table stackable">
                                    <thead>
                                        <tr>
                                            <th>Customer</th>
                                            <th>Status</th>
                                            <th>Date Added</th>
                                            <th>Total</th>
                                            <th>Lorem</th>
                                            <th>Lorem</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a  href="#">Summer Throssell</a></td>
                                            <td>Pending</td>
                                            <td>24/04/2012</td>
                                            <td>$120.23</td>
                                            <td>ipsum dolor sit</td>
                                            <td>ipsum dolor sit</td>
                                        </tr>
                                        <tr>
                                            <td><a  href="#">Declan Pamphlett</a></td>
                                            <td>Pending</td>
                                            <td>23/04/2012</td>
                                            <td>$320.00</td>
                                            <td>ipsum dolor sit</td>
                                            <td>ipsum dolor sit</td>
                                        </tr>
                                        <tr>
                                            <td><a  href="#">Erin Church</a></td>
                                            <td>Pending</td>
                                            <td>23/04/2012</td>
                                            <td>$44.00</td>
                                            <td>ipsum dolor sit</td>
                                            <td>ipsum dolor sit</td>
                                        </tr>
                                        <tr>
                                            <td><a  href="#">Koby Auld</a></td>
                                            <td>Pending</td>
                                            <td>22/04/2012</td>
                                            <td>$180.20</td>
                                            <td>ipsum dolor sit</td>
                                            <td>ipsum dolor sit</td>
                                        </tr>
                                        <tr>
                                            <td><a  href="#">Anthony Pound</a></td>
                                            <td>Pending</td>
                                            <td>20/04/2012</td>
                                            <td>$610.42</td>
                                            <td>ipsum dolor sit</td>
                                            <td>ipsum dolor sit</td>
                                        </tr>
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
    if($(window).width() > '1280') {
        $('body').append('<a href="javascript:void" class="fluid_lay" style="position:fixed;top:6px;right:10px;z-index:10000" title="fluid layout"><i class="splashy-arrow_state_grey_left"></i><i class="splashy-arrow_state_grey_right"></i></a>');
        $('.fluid_lay').click(function() {
            var url = window.location.href;    
            if (url.indexOf('?') > -1){
               url += '&fluid=1'
            }else{
               url += '?fluid=1'
            }
            window.location.href = url;
        });
        $(window).on('resize',function() {
            if($(window).width() > '1280') {
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
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
    </body>


</html>
