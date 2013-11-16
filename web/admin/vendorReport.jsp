<%-- 
    Document   : users
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
        </head>
        <body>
        <jsp:include page="nav.jsp"></jsp:include>
            <div style="margin-top: 20px; margin-left: 40%; font-family: cursive;">
                <label style="font-size: 200%"> Vendor Report </label>
            </div>
            <div style="margin-top: 20px; margin-left: 30px; margin-right: 30px">
                <table class="table" id="table_my_table">
                    <thead>
                        <tr style="font-family: cursive">
                            <th title="Click to sort Name wise"><label>Vendor Name</label></th>
                            <th title="Click to sort Mobile No wise"><label>Mobile No</label></th>
                            <th title="Click to sort E-mail ID wise"><label>E-Mail ID</label></th>
                            <th title="Click to sort Lane wise"><label>Lane</label></th>
                            <th title="Click to sort City wise"><label>City</label></th>
                            <th title="Click to sort Area wise"><label>Area</label></th>
                            <th title="Click to sort Landline No wise"><label>Landline No</label></th>
                            <th title="Click to sort Status wise"><label>Status</label></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${vendor}" var="vendors">
                        <tr>
                            <td>${vendors.vendorName}</td>
                            <td>${vendors.mobileNo}</td>
                            <td>${vendors.emailID}</td>
                            <td>${vendors.lane}</td>
                            <td>${vendors.area.city.cityName}</td>
                            <td>${vendors.area.areaName}</td>
                            <td>${vendors.landlineNumber}</td>
                            <c:choose>
                                <c:when test="${vendors.status}">
                                    <td>Active</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Inactive</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td>Hiren</td>
                            <td>1111</td>
                            <td>zzz@gmail.com</td>
                            <td>aaa</td>
                            <td>zzz</td>
                            <td>aaa</td>
                            <td>999</td>
                            <td>Inactive</td>
                        </tr>
                </tbody>
            </table>
        </div>
        <div class="footer_space"></div>
    </body>
</html>
