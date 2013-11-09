<%-- 
    Document   : vendor
    Created on : Oct 12, 2013, 1:59:49 AM
    Author     : HR
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html>
    <head>

        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />
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


            <!-- two forms for VENDOR DETAILS starts here -->
            <article class="wrapper">
                <ul class="breadcrumb">
                    <li><a href="Controller?action=getIndex">Home</a> <span class="divider">/</span></li>
                    <lii class="active">Vendor</li>
                </ul>
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
                            <a href="feedback.jsp?userName=${vendor.userName}" class="button">Give Feedback For ${vendor.vendorName}</a>

                        </div>



                    </form>
                </div>
                <div style="float: right">
                    <form class="vendor"> 
                        <script type="text/javascript">
                            $('#myTab a').click(function(e) {
                                e.preventDefault()
                                $(this).tab('show')
                            })
                        </script>
                        <ul id="myTab" class="nav nav-tabs">
                            <li class="active"><a href="#Lunch" data-toggle="tab">Lunch</a></li>
                            <li><a href="#Dinner" data-toggle="tab">Dinner</a></li>
                        </ul>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade active in" id="Lunch">
                                <table id="MenuTable">
                                    <c:if test="${menu.tiffinName}">
                                        <tr>
                                            <td>
                                                Description : 
                                            </td>
                                            <td>
                                                ${menu.tiffinName}
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:set var="count" value="${0}"/>
                                    <c:set var="item" value="${0}"/>
                                    <input type="hidden" id="MenuID" value="${menu.menuID}" />
                                    <input type="hidden" id="VendorUN" value="${vendor.userName}" />
                                    <c:forEach items="${menu.menuItem}" var="list">

                                        <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                            <tr>
                                                <td>
                                                    Subji :
                                                </td>
                                                <td>
                                                    <c:set var="item" value="${item + 1}"/>
                                                    <select id="item${item}" class="sabzi">
                                                        <option id="0" value="0" data-price="0">Select</option>
                                                        <c:forEach items="${menu.menuItem}" var="list">
                                                            <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                                                <option id="${list.item.itemID}" value="${list.item.itemID}" data-price="${list.cost}">
                                                                    ${list.item.itemName} Rs.${list.cost}
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
                                            <c:set var="count" value="${count + (list.cost * list.quantity)}"/>
                                            <tr class="sumRoti">
                                                <td data-price="${list.cost}">
                                                    ${list.item.itemName} :
                                                </td>
                                                <td data-quantity="${list.quantity}">
                                                    # ${list.quantity} * Rs.${list.cost} &nbsp; <input type="text" placeholder="Extra" class="txtQuantityRoti" value="" style="width:45px;" />
                                                </td>
                                            </tr>
                                            <input type="hidden" id="rotiID" value="${list.item.itemID}" />
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach items="${menu.menuItem}" var="list">
                                        <c:if test="${list.item.type.typeName == 'Rice'}">
                                            <c:set var="count" value="${count + list.cost}"/>
                                            <tr class="sum">
                                                <td data-price="${list.cost}">
                                                    Rice :
                                                </td>
                                                <td>
                                                    ${list.item.itemName} (${list.cost}) Rs.
                                                </td>
                                            </tr>
                                            <input type="hidden" id="riceID" value="${list.item.itemID}" />
                                        </c:if>
                                    </c:forEach>

                                    <c:forEach items="${menu.menuItem}" var="list">
                                        <c:if test="${list.item.type.typeName == 'Dal'}">
                                            <c:set var="count" value="${count + list.cost}"/>
                                            <tr class="sum">
                                                <td data-price="${list.cost}">
                                                    Dal :
                                                </td>
                                                <td>
                                                    ${list.item.itemName} (${list.cost}) Rs.
                                                </td>
                                            </tr>
                                            <input type="hidden" id="dalID" value="${list.item.itemID}" />
                                        </c:if>
                                    </c:forEach>        


                                    <c:forEach items="${menu.menuItem}" var="list">
                                        <c:if test="${list.item.type.typeName == 'Salad'}">
                                            <c:set var="count" value="${count + list.cost}"/>
                                            <tr class="sum" data-id ="${list.item.itemID}">
                                                <td data-price="${list.cost}">
                                                    Salad :
                                                </td>
                                                <td>
                                                    Available (${list.cost}) Rs.
                                                </td>
                                            </tr>
                                            <input type="hidden" id="saladID" value="${list.item.itemID}" />
                                        </c:if>
                                    </c:forEach>        


                                    <tr>
                                        <td>
                                            <label>Enter total no of tiffins :</label>
                                        </td>
                                        <td>
                                            <div style="float:left;">
                                                <input type="text" id="txtTiffinQ" class="txtTiffinQ" name="tiffin" style="width:40px;"/>
                                            </div>
                                            <div style="float:left;">

                                                <label id="cost" data-price="${count}" style="padding-top: 10px;">* ${count}</label>
                                            </div>

                                            <div class="clearfix"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Grand total of all tiffins :</label>
                                        </td>
                                        <td>
                                            <label id="totalcost" style="float: left">Rs. ${count} </label> &nbsp; 
                                        </td>
                                    </tr>
                                </table>

                                <div class="center">
                                    <% if (session.getAttribute("UserName") != null) {
                                    %> 
                                    <a href="#" class="button" id="placeorder">Order</a>

                                    <% } else {
                                    %>
                                    <a href="login.jsp?from=${pageContext.request.requestURI}&vendorUN=<%= request.getParameter("vendorUN")%>"  class="button">Login to Order</a>

                                    <%
                                }%>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Dinner">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
                            </div>
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

<script src="js/../bootstrap/js/bootstrap.js"></script>

