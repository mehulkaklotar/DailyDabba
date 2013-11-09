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
                <div style="height: 500px;">
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
                            </tr>
                        </thead>
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
                        </tr>
                        </c:forEach>
                    </table>
                </div>
            </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

