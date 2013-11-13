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
        <meta charset="UTF-8">
        <jsp:include page="commonStyle.jsp"></jsp:include>
        </head>

        <body>
        <jsp:include page="nav.jsp"></jsp:include>
        <div style="margin-top: 20px; margin-left: 40%; font-family: cursive;">
            <label style="font-size: 200%"> Customer Report </label>
        </div>
        <div style="margin-top: 20px; margin-left: 30px; margin-right: 30px">
                <table class="table" id="table_my_table">
                    <thead>
                        <tr style="font-family: cursive">
                            <th title="Click to sort Name wise"><label>Name</label></th>
                            <th title="Click to sort Lane wise"><label>Lane</label></th>
                            <th title="Click to sort Area wise"><label>Area</label></th>
                            <th title="Click to sort Mobile No wise"><label>Mobile No</label></th>
                            <th title="Click to sort E-Mail wise"><label>E-Mail</label></th>
                            <th title="Click to sort Status wise"><label>Status</label></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${customer}" var="cutomers">
                        <tr>
                            <td>${cutomers.firstName} ${cutomers.lastName}</td>
                            <td>${cutomers.lane}</td>
                            <td>${cutomers.area.areaName}</td>
                            <td>${cutomers.mobileNo}</td>
                            <td>${cutomers.emailID}</td>
                            <c:choose>
                                <c:when test="${cutomers.status}">
                                    <td>Active</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Inactive</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="footer_space"></div>
    </div> 
</body>
</html>
