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
        <jsp:include page="commonStyle.jsp"></jsp:include>
        <jsp:include page="commonJs.jsp"></jsp:include>
            <script defer="defer">
                $(document).ready(function()
                {
                    $("#table_my_table").tablesorter();
                }
                );
            </script>
            <meta charset="UTF-8">
        </head>

        <body>
        <jsp:include page="nav.jsp"></jsp:include>
            <div style="margin-top: 20px; margin-left: 40%; font-family: cursive;">
                <label style="font-size: 200%"> Order Report </label>
            </div>
            <div style="margin-top: 20px; margin-left: 30px; margin-right: 30px">
                <table class="table" id="table_my_table">
                    <thead>
                        <tr style="font-family: cursive">
                            <th title="Click to sort Vendor Name wise"><label>Vendor</label></th>
                            <th title="Click to sort Customer Name wise"><label>Customer</label></th>
                            <th title="Click to sort Address wise"><label>Delivery Address</label></th>
                            <th title="Click to sort Status wise"><label>Delivery Status</label></th>
                            <th title="Click to sort No of tiffines wise"><label>No of Tiffins</label></th>
                            <th title="Click to sort Date wise"><label>Order Date</label></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td>${order.Vendor}</td>
                            <td>${order.Customer}</td>
                            <td>${order.DeliveryAddress}</td>
                            <c:choose>
                                <c:when test="${order.Status}">
                                    <td>Delivered</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Not Delivered</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${order.NoOfTiffin}</td>
                            <td>${order.OrderDate}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <div class="footer_space"></div>
        </div> 
    </body>
</html>
