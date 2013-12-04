<%-- 
    Document   : vendor
    Created on : Oct 12, 2013, 1:59:49 AM
    Author     : HR
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            <script src="js/jquery-scrollto.js"></script>
            
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
          <!-- <script>
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

                if (sTH < 9) { // if system time is not greater than 9 AM then don't show the Lunch menu)
                    var label = $("<label>").text("You can not order now. Orders will be accepted from 9 AM to 11 AM").addClass('alert');
                    $('#Lunch').before(label);
                    /*$('#lblLunch').text("You can not order now. Orders will be accepted from 9 AM to 11 AM");*/
                    $('#Lunch').hide();
                } else if (sTH >= 11) {
                    var label = $("<label>").text("You can not order now. Orders will be accepted from 9 AM to 11 AM").addClass('alert');
                    $('#Lunch').before(label);
                    /*$('#lblLunch').text("You can not order now. Orders will be accepted from 9 AM to 11 AM");*/
                    $('#Lunch').hide();
                }

                if (sTH < 16) { // if system time is greater than 14 PM (i.e 2 PM)  then don't show the Dinner menu
                    var label = $("<label>").text("You can not order now. Orders will be accepted from 2 PM to 4 PM").addClass('alert');
                    $('#Dinner').append(label);
                    $('#Dinner').hide();
                } else if (sTH >= 18) {
                    var label = $("<label>").text("You can not order now. Orders will be accepted from 2 PM to 4 PM").addClass('alert');
                    $('#Dinner').append(label);
                    $('#Dinner').hide();
                }
            });
                </script> -->
        <%
            Date date = new Date();
            String sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);

        %>
    <span id="sDate" value="<%= sd%>" class="sDate"></span>

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
                <a href="Controller?action=getIndex"></a> </div>
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
        <div>
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
                            <td colspan="2">
                                <% if (session.getAttribute("UserName") != null) {
                                %> 
                                <a href="Controller?action=blockVendor&UserName=${vendor.userName}" class="button">Block ${vendor.vendorName}</a>

                                <% } else {
                                %>
                                <a href="login.jsp?from=${pageContext.request.requestURI}&vendorUN=${vendor.userName}"  class="button" style="margin-bottom: 10px;">Login to block vendor</a>

                                <%                                }
                                %>

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
                        <tr>
                            <td colspan="2">
                                <div style="margin-bottom: 10px">

                        <% if (session.getAttribute("UserName") != null) {
                        %> 
                        <a href="feedback.jsp?userName=${vendor.userName}" class="button">Give Feedback For ${vendor.vendorName}</a>

                        <% } else {
                        %>
                        <a href="login.jsp?from=${pageContext.request.requestURI}&vendorUN=${vendor.userName}"  class="button" style="margin-bottom: 10px;">Login to give feedback</a>

                        <%                                }
                        %>
                    </div>
                            </td>
                            
                        </tr>
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

                            <c:choose>
                                <c:when test="${empty menuLunch}">
                                    No Lunch from this vendor
                                </c:when>
                                <c:otherwise>
                                    <label class="alert-error" id ="errorLunch"></label>
                                    <table id="MenuTable">
                                        <c:if test="${menuLunch.tiffinName}">
                                            <tr>
                                                <td>
                                                    Description : 
                                                </td>
                                                <td>
                                                    ${menuLunch.tiffinName}
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:set var="count" value="${0}"/>
                                        <c:set var="item" value="${0}"/>
                                        <input type="hidden" id="MenuIDLunch" value="${menuLunch.menuID}" />
                                        <input type="hidden" id="VendorUN" value="${vendor.userName}" />
                                        <c:forEach items="${menuLunch.menuItem}" var="list">

                                            <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                                <tr>
                                                    <td>
                                                        Subji :
                                                    </td>
                                                    <td>
                                                        <c:set var="item" value="${item + 1}"/>
                                                        <select id="item${item}" class="sabziLunch">
                                                            <option id="0" value="0" data-price="0">Select</option>
                                                            <c:forEach items="${menuLunch.menuItem}" var="list">
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

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Roti'}">
                                                <c:set var="count" value="${count + (list.cost * list.quantity)}"/>
                                                <tr class="sumRotiLunch">
                                                    <td data-price="${list.cost}">
                                                        ${list.item.itemName} :
                                                    </td>
                                                    <td data-quantity="${list.quantity}">
                                                        # ${list.quantity} * Rs.${list.cost} &nbsp; <input type="text" placeholder="Extra" class="txtQuantityRotiLunch" value="" style="width:45px;" />
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="rotiIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Rice'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch">
                                                    <td data-price="${list.cost}">
                                                        Rice :
                                                    </td>
                                                    <td>
                                                        ${list.item.itemName} (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="riceIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Dal'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch">
                                                    <td data-price="${list.cost}">
                                                        Dal :
                                                    </td>
                                                    <td>
                                                        ${list.item.itemName} (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="dalIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>        


                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Salad'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Salad :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="saladIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach> 

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Pickle'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Pickle :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="pickleIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Papad'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Papad :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="papadIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Buttermilk'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Buttermilk :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="buttermilkIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuLunch.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Curd'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Curd :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="curdIDLunch" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>          
                                        <tr>
                                            <td>
                                                <label>Enter total no of tiffins :</label>
                                            </td>
                                            <td>
                                                <div style="float:left;">
                                                    <input type="text" id="txtTiffinQLunch" class="txtTiffinQLunch" name="tiffin" style="width:40px;"/>
                                                </div>
                                                <div style="float:left;">

                                                    <label id="costLunch" data-price="${count}" style="padding-top: 10px;">* ${count}</label>
                                                </div>

                                                <div class="clearfix"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Grand total of all tiffins :</label>
                                            </td>
                                            <td>
                                                <label id="totalcostLunch" style="float: left">Rs. ${count} </label> &nbsp; 
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="center">
                                        <% if (session.getAttribute("UserName") != null) {
                                        %> 
                                        <a href="#" class="button" style="margin-bottom: 10px;" id="placeorderLunch">Order</a>

                                        <% } else {
                                        %>
                                        <a href="login.jsp?from=${pageContext.request.requestURI}&vendorUN=<%= request.getParameter("vendorUN")%>"  class="button" style="margin-bottom: 10px;">Login to Order</a>

                                        <%
                                            }%>
                                    </div>

                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class="tab-pane fade" id="Dinner">

                            <c:choose>
                                <c:when test="${empty menuDinner} ">
                                    No Dinner from this vendor
                                </c:when>
                                <c:otherwise>
                                    <label class="alert-error" id ="errorDinner"></label>
                                    <table id="MenuTable">
                                        <c:if test="${menuDinner.tiffinName}">
                                            <tr>
                                                <td>
                                                    Description : 
                                                </td>
                                                <td>
                                                    ${menuDinner.tiffinName}
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:set var="count" value="${0}"/>
                                        <c:set var="item" value="${0}"/>
                                        <input type="hidden" id="MenuIDDinner" value="${menuDinner.menuID}" />
                                        <c:forEach items="${menuDinner.menuItem}" var="list">

                                            <c:if test="${list.item.type.typeName eq 'Sabzi'}">
                                                <tr>
                                                    <td>
                                                        Subji :
                                                    </td>
                                                    <td>
                                                        <c:set var="item" value="${item + 1}"/>
                                                        <select id="item${item}" class="sabziDinner">
                                                            <option id="0" value="0" data-price="0">Select</option>
                                                            <c:forEach items="${menuDinner.menuItem}" var="list">
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

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Roti'}">
                                                <c:set var="count" value="${count + (list.cost * list.quantity)}"/>
                                                <tr class="sumRotiDinner">
                                                    <td data-price="${list.cost}">
                                                        ${list.item.itemName} :
                                                    </td>
                                                    <td data-quantity="${list.quantity}">
                                                        # ${list.quantity} * Rs.${list.cost} &nbsp; <input type="text" placeholder="Extra" class="txtQuantityRotiDinner" value="" style="width:45px;" />
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="rotiIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Rice'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumDinner">
                                                    <td data-price="${list.cost}">
                                                        Rice :
                                                    </td>
                                                    <td>
                                                        ${list.item.itemName} (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="riceIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Dal'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumDinner">
                                                    <td data-price="${list.cost}">
                                                        Dal :
                                                    </td>
                                                    <td>
                                                        ${list.item.itemName} (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="dalIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>        


                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Salad'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumDinner" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Salad :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="saladIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>        

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Pickle'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Pickle :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="pickleIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Papad'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Papad :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="papadIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Buttermilk'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Buttermilk :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="buttermilkIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>  

                                        <c:forEach items="${menuDinner.menuItem}" var="list">
                                            <c:if test="${list.item.type.typeName == 'Curd'}">
                                                <c:set var="count" value="${count + list.cost}"/>
                                                <tr class="sumLunch" data-id ="${list.item.itemID}">
                                                    <td data-price="${list.cost}">
                                                        Curd :
                                                    </td>
                                                    <td>
                                                        Available (${list.cost}) Rs.
                                                    </td>
                                                </tr>
                                                <input type="hidden" id="curdIDDinner" value="${list.item.itemID}" />
                                            </c:if>
                                        </c:forEach>          
                                        <tr>
                                            <td>
                                                <label>Enter total no of tiffins :</label>
                                            </td>
                                            <td>
                                                <div style="float:left;">
                                                    <input type="text" id="txtTiffinQDinner" class="txtTiffinQDinner" name="tiffin" style="width:40px;"/>
                                                </div>
                                                <div style="float:left;">

                                                    <label id="costDinner" data-price="${count}" style="padding-top: 10px;">* ${count}</label>
                                                </div>

                                                <div class="clearfix"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Grand total of all tiffins :</label>
                                            </td>
                                            <td>
                                                <label id="totalcostDinner" style="float: left">Rs. ${count} </label> &nbsp; 
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="center">
                                        <% if (session.getAttribute("UserName") != null) {
                                        %> 
                                        <a href="#" class="button" style="margin-bottom: 5px;" id="placeorderDinner">Order</a>

                                        <% } else {
                                        %>
                                        <a href="login.jsp?from=${pageContext.request.requestURI}&vendorUN=<%= request.getParameter("vendorUN")%>"  class="button" style="margin-bottom: 10px;">Login to Order</a>

                                        <%
                                            }%>
                                    </div>

                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>



                </form>
            </div>

        </div>
        <div id="cleardiv" style="clear: both"></div>
    </article>
    <!-- two forms for VENDOR DETAILS endss here -->

    <jsp:include page="footer.jsp"></jsp:include>

    <button class="back-to-top">^</button>
</body>
</html>

<script src="js/../bootstrap/js/bootstrap.js"></script>

