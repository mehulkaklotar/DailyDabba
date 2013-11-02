<%-- 
    Document   : vendor
    Created on : Oct 12, 2013, 1:59:49 AM
    Author     : HR
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>


<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>


<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">

        <jsp:include page="include.jsp"></jsp:include>
        <script src="js/commonTask.js"></script>

        <style type="text/css">
            .vendor{
                width: 555px;
                padding-left: 20px;
                padding-right: 20px;
                background-color: #fff;
                text-align: left;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
            }
        </style>
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
                    <span>Welcome, Guest</span>
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


        <!-- two forms for VENDOR DETAILS starts here -->
        <article class="wrapper">
            <div style="height:1000px">
                <div style="float: left">
                    <form class="vendor">
                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-user"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center;">Vendor Details </h3>
                            </div>
                        </div>
                        <table>
                            <tr>
                                <td style="width: 30%">
                                    Vendor Name : 
                                </td>
                                <td>
                                    ${vendor.vendorName}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Vendor Owner Name : 
                                </td>
                                <td>
                                    ${vendor.ownerName}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Covered Area : 
                                </td>

                                <td>
                                    <c:forEach items="${vendor.areas}" var="areall" >
                                        ${areall.areaName},
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone no :
                                </td>
                                <td>
                                    Mobile : ${vendor.mobileNo}, Landline : ${vendor.landlineNumber}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Rating :
                                </td>
                                <td>
                                    <div class="input-append">
                                        <label class="add-on">${rating}</label>
                                        <span class="add-on">/10</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Order :
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="button">Lunch</button>
                                    <button class="btn btn-primary" type="button">Dinner</button>
                                </td>
                            </tr>
                        </table>
                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-pencil"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center">Feedback From Customers </h3>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <c:forEach items="${feedback}" var="vendorFeedback" >
                                <tr>     
                                    <td>
                                        ${vendorFeedback.customer.firstName} ${vendorFeedback.customer.lastName}
                                    </td>
                                    <td style="width: 70%">
                                        ${vendorFeedback.message}
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <div style="margin-bottom: 10px">
                            <button class="btn btn-large btn-block btn-primary" type="button" style="width: 70%; margin: auto" onclick="window.location='feedback.jsp?userName=${vendor.userName}'">Give your Feedback</button>
                        </div>



                    </form>
                </div>
                <div style="float: right">
                    <form class="vendor"> 
                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-bell"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center">Lunch </h3>
                            </div>
                        </div>
                        <table>
                            <c:if test="${description.tiffinName}">
                                <tr>
                                    <td>
                                        Description : 
                                    </td>
                                    <td>
                                        ${description.tiffinName}
                                    </td>
                                </tr>
                            </c:if>
                            <c:set var="count" value="${0}"/>
                            <c:forEach items="${menu.menuItem}" var="list">
                                <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                    <c:set var="count" value="${count + list.cost}"/>
                                    <tr>
                                        <td>
                                            Subji :
                                        </td>
                                        <td>
                                            <select>
                                                <c:forEach items="${menu.menuItem}" var="list">
                                                    <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                                        <option>
                                                            ${list.item.itemName} (${list.cost}) Rs.
                                                        </option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${menu.menuItem}" var="list">
                                <c:if test="${list.item.type.typeName == 'Roti'}">
                                    <tr>
                                        <td>
                                            ${list.item.itemName} :
                                        </td>
                                        <td>
                                            ${list.quantity} (${list.cost}) Rs.
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + list.cost}"/>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${menu.menuItem}" var="list">
                                <c:if test="${list.item.type.typeName == 'Rice'}">
                                    <tr>
                                        <td>
                                            Rice :
                                        </td>
                                        <td>
                                            ${list.item.itemName} (${list.cost}) Rs.
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + list.cost}"/>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${menu.menuItem}" var="list">
                                <c:if test="${list.item.type.typeName == 'Dal'}">
                                    <tr>
                                        <td>
                                            Dal :
                                        </td>
                                        <td>
                                            ${list.item.itemName} (${list.cost}) Rs.
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + list.cost}"/>
                                </c:if>
                            </c:forEach>        


                            <c:forEach items="${menu.menuItem}" var="list">
                                <c:if test="${list.item.type.typeName == 'Salad'}">
                                    <tr>
                                        <td>
                                            Salad :
                                        </td>
                                        <td>
                                            Available (${list.cost}) Rs.
                                        </td>
                                    </tr>
                                    <c:set var="count" value="${count + list.cost}"/>
                                </c:if>
                            </c:forEach>        

                            <tr>
                                <td>
                                    <label>Total Prize of one tiffin :</label>
                                </td>
                                <td id="cost">
                                    <c:set var="count" value="${count + list.cost}"/>
                                    <label>${count}</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Enter total no of tiffins :</label>
                                </td>
                                <td>
                                    <input type="text" name="tiffin" style="width: 5em"/>&nbsp; * 50 <span> = Total : </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Grand total of all tiffins :</label>
                                </td>
                                <td>
                                    <label style="float: left">500 rs. </label> &nbsp; <button class="btn btn-primary" type="button" style="float:right">Add to Cart</button>
                                </td>
                            </tr>
                        </table>


                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-shopping-cart"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center">Your Tiffine Cart </h3>
                            </div>
                        </div>
                        <table>
                            <thead>
                                <tr style="width: 10%">
                                    <td>
                                        No
                                    </td>
                                    <td>
                                        Sabji 1
                                    </td>
                                    <td>
                                        Sabji 2
                                    </td>
                                    <td>
                                        No of Roti
                                    </td>
                                    <td>
                                        No of Tiffins
                                    </td>
                                    <td>
                                        Cost per Tiffin (Rs.)
                                    </td>
                                    <td>
                                        Total Cost (Rs.)
                                    </td>
                                </tr>
                            </thead>
                            <tr>
                                <td>1</td>
                                <td>Panner Tikaa Masala</td>
                                <td>Mix Vegetables</td>
                                <td>7</td>
                                <td>3</td>
                                <td>50</td>
                                <td>150</td>
                            </tr>
                        </table>
                        <!--<div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-plus"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center">Place Order </h3>
                            </div>
                        </div> -->
                        <div>
                            <button class="btn btn-large btn-block btn-primary" type="button" style="width: 70%; margin: auto; margin-bottom: 10px;">Click to place Order !!</button>
                        </div>
                    </form>
                </div>
            </div>
        </article>
        <!-- two forms for VENDOR DETAILS endss here -->

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>