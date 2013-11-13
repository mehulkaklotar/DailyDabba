<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <script src="js/../bootstrap/js/bootstrap.js"></script>
        <script src="js/../bootstrap/js/bootstrap.min.js"></script>
        <link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
        <link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
        <link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">

        <jsp:include page="include.jsp"></jsp:include>


        </head>

        <body class="home">
            <header>
                <div class="nav-bar">
                    <div class="nav-inside"> </div>
                </div>
                <div class="wrapper"> 

                    <!-- ******** LOGO START ******** -->
                    <div class="logo">
                        <h2>Daily Dibba</h2>
                        <!--<img src="images/daily-dibba.png" width="150" height="120"/>-->
                        <p>Eat Healthy, Live Healthy</p>
                        <a href="index.html"></a> </div>
                    <!-- ******** LOGO END ******** -->

                    <!-- ******** NAVIGATION START ******** -->

                <jsp:include page="nav.jsp"></jsp:include>

                    <button class="nav-trigger">Navigation</button>

                    <!-- ******** NAVIGATION END ******** --> 

                    <div class="labelWelcome">
                        <span>Welcome, 
                        <% if (session.getAttribute("UserName") != null) {
                                out.print(session.getAttribute("UserName"));
                        %> <a href='Controller?action=logout'>Logout</a> 
                        <%
                        } else {
                        %> Guest
                        <% }
                        %>
                    </span>
                </div>
            </div>
            <!-- ******** FULL WIDTH SLIDER START ******** -->
            <div id="fwslider">
                <div class="slider_container">

                    <div class="slide" style="height:300px;" > 
                        <img src="images/thali.JPG" />

                    </div>

                    <div class="slide" style="height:300px;"> 
                        <img src="images/thali1.jpg" />

                    </div>

                    <div class="slide" style="height:300px;"> 
                        <img src="images/thali2.jpg" />

                    </div>

                </div>


                <div class="timers"></div>
                <div class="slidePrev"><span></span></div>
                <div class="slideNext"><span></span></div>
            </div> 
            <div style="height:20px;background-color: #222;">

            </div>
            <!-- ******** FULL WIDTH SLIDER END ******** -->

        </header>

        <article class="wrapper"> 
            <div style="height: auto;">
                <ul class="breadcrumb">
                    <li><a href="Controller?action=getIndex">Home</a> <span class="divider">/</span></li>
                    <li class="active">Order History</li>
                </ul>
                <table class="table">
                    <thead style="color: white; background-color: rgb(47, 187, 178)">
                        <tr style="text-align: center">
                            <td>
                                No
                            </td>
                            <td title="Click on vendor name to give Feedback">
                                Vendor Name
                            </td>
                            <td>
                                Date
                            </td>
                            <td>
                                Total Tiffins
                            </td>
                            <td>
                                Total Cost (Rs.)
                            </td>
                            <td>

                            </td>
                        </tr>
                    </thead>
                    <c:choose>
                        <c:when test="${!empty history}">
                            <c:set var="i" value="${0}"/>
                            <c:forEach items="${history}" var="h">
                                <c:set var="i" value="${i + 1}"/>
                                <tr style="text-align: center">
                                    <td>
                                        ${i}
                                    </td>
                                    <td>
                                        <a  href="Controller?action=getVendor&vendorUN=${h.menu.vendor.getUserName()}">${h.menu.vendor.getVendorName()}</a>
                                    </td>
                                    <td>
                                        ${h.getOrderDate()}
                                    </td>
                                    <td>
                                        ${h.getNumberOfTiffin()}
                                    </td>
                                    <td>
                                        ${h.getTotalcost() * h.getNumberOfTiffin()}
                                    </td>
                                    <td>
                                        <a  href="Controller?action=cancelOrder&orderID=${h.getOrderID()}&from=${pageContext.request.requestURI}">Cancel Order?</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr style="text-align: center">
                                <td colspan="6">No Orders</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </table>
                <jsp:useBean id="now" class="java.util.Date"/>
                <script>
                    $(function() {
                        var server = $(".sDate").attr("value");
                        var sarr = server.split(" ");

                        var sDate = sarr[0]; // server Date
                        var sTime = sarr[1]; // server Time

                        var sD = sDate.split("-"); // split date
                        var sDY = sD[0]; // Year
                        var sDM = sD[1]; // Month
                        var sDD = sD[2]; // Date

                        var sT = sTime.split(":"); // split time
                        var sTH = sT[0]; // Hour
                        var sTM = sT[1]; // Minute
                        var sTS = sT[2]; // Second

                        if (sTH < 7) { // if system time is not greater than 9 AM then don't show the Lunch menu)
                            var label = $("<label>").text("Sorry.You can not update Lunch Menu. Time range is 7 AM to 9 AM.").addClass('myLabel1');
                            $('.row-fluid').before(label);
                            $('.lunchBox').hide();
                        } else if (sTH >= 9) {
                            var label = $("<label>").text("Sorry.You can not update Lunch Menu. Time range is 7 AM to 9 AM.").addClass('myLabel1');
                            $('.row-fluid').before(label);
                            $('.lunchBox').hide();
                        }

                        if (sTH < 14) { // if system time is greater than 14 PM (i.e 2 PM)  then don't show the Dinner menu
                            var label = $("<label>").text("Sorry.You can not update Dinner Menu. Time range is 2 PM to 4 PM.").addClass('myLabel2');
                            $('.row-fluid').append(label);
                            $('.dinnerBox').hide();
                        } else if (sTH >= 16) {
                            var label = $("<label>").text("Sorry.You can not update Dinner Menu. Time range is 2 PM to 4 PM.").addClass('myLabel2');
                            $('.row-fluid').append(label);
                            $('.dinnerBox').hide();
                        }
                    });
                </script>
                <span id="sDate" value="${now}" class="sDate"></span>
            </div>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

