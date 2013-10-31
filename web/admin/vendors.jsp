<%-- 
    Document   : users
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>
<%@page import="java.util.Iterator"%>
<%@page import="com.dailydibba.bean.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dailydibba.bean.Area"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>

        <meta charset="UTF-8">
        <title>Daily Dabba : Admin</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <script> src="js.commonTask.js"</script>
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
        <!-- Yahoo autocomplete widget -->
            <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
            <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/autocomplete/assets/skins/sam/autocomplete.css" />
            <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
            <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/animation/animation-min.js"></script>
            <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/datasource/datasource-min.js"></script>
            <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/autocomplete/autocomplete-min.js"></script>
        
              <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
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
                    <li><a href="AdminController?action=getAllVendors">Vendor</a></li>
                    <li><span>View Vendors ...</span></li>
                </ul>
        </div>
            
        <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span12">
                        
                         <%
                    List<Area> areaList = (List<Area>) request.getAttribute("areas");
                    String str = "";
                    Iterator it = areaList.iterator();
                    while (it.hasNext()) {
                        Area objArea = (Area) it.next();
                        str += "'" + objArea.getAreaName() + "',";
                    }

                %>
                        <input value="" placeholder="Search" class="span3" type="text" name="txtSearch" id="txtSearch"  onchange="showVenddor()"/>                      
                         <div id="myContainer"></div>
                        <script type="text/javascript">
                                    YAHOO.example.Data = {
                                        arrayStates: [
                                    <%= str%>
                                        ]
                                    };
                                    YAHOO.example.BasicLocal = function() {
                                        // Use a LocalDataSource
                                        var oDS = new YAHOO.util.LocalDataSource(YAHOO.example.Data.arrayStates);
                                        // Optional to define fields for single-dimensional array
                                        oDS.responseSchema = {fields: ["state"]};
                                        // Instantiate the AutoComplete
                                        var oAC = new YAHOO.widget.AutoComplete("txtSearch", "myContainer", oDS);
                                        oAC.prehighlightClassName = "yui-ac-prehighlight";
                                        oAC.useShadow = true;
                                        return {
                                            oDS: oDS,
                                            oAC: oAC
                                        };
                                    }();


                                </script>
                        <div class="w-box">                            
                            <div class="w-box-header">
                                <div class="btn-group">
                                    <a href="#" class="btn btn-inverse btn-mini delete_rows_dt" data-tableid="dt_gal" title="Edit">Delete</a>
                                    <a href="#" class="btn btn-inverse btn-mini" title="View">Another Action</a>
                                </div>
                            </div>
                            <div class="w-box-content">
                                <table class="table table-vam table-striped" id="dt_gal">
                                    <thead>
                                        <tr>
                                            <th class="table_checkbox" style="width:13px"><input type="checkbox" name="select_rows" class="select_rows" data-tableid="dt_gal" /></th>
                                          
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <c:forEach items="${vendorList}" var="vendor">
                                        <tr>
                                            <td><input type="checkbox" name="row_sel" class="row_sel" /></td>
                                            
                                            <td><a href="Controller?action=getVendor&vendorUN=${vendor.getVendorName()}"> <c:out value="${vendor.vendorName}"/></a><br/>Rating:<c:out value="${vendor.rating}"/></td>
                                            
                                            <td>   
                                                <c:choose>
                                                    <c:when test="${vendor.status == true}" >
                                                        Active
                                                    </c:when>
                                                    <c:otherwise>
                                                        Inactive                                                        
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="btn-group">
                                                    <a href="#" class="btn btn-mini" title="Edit"><i class="icon-pencil"></i></a>
                                                    <a href="#" class="btn btn-mini" title="View"><i class="icon-eye-open"></i></a>
                                                    <a href="#" class="btn btn-mini" title="Delete"><i class="icon-trash"></i></a>
                                                </div>
                                            </td>
                                        </tr></c:forEach>
                                        
                                    </tbody>
                                </table>
                            </div> 
            
                            <div class="w-box-footer">
                                <div class="pagination pagination-centered">
                                    <ul>
                                        <li class="disabled"><a href="#">Prev</a></li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">Next</a></li>
                                    </ul>
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
