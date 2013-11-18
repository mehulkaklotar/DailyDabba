<%-- 
    Document   : users
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : Hiren
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
                <label style="font-size: 200%"> Today's Lunch Report </label>
            </div>
            <div style="margin-top: 20px; margin-left: 30px; margin-right: 30px">
                <table class="table" id="table_my_table">
                    <thead>
                        <tr style="font-family: cursive">
                            <th title="Click to sort Vendor wise"><label>Vendor</label></th>
                            <th title="Click to sort Message wise"><label>Menu ID</label></th>
                            <th title="Click to sort Date wise"><label>Date and Time</label></th>
                            <th title="Click to sort Rating wise"><label>Tiffin Description</label></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${lunch}" var="menu">
                        <tr title="Click on Vendor name to see detailed Lunch Menu">
                            <td> <a href="AdminController?action=getVendorMenuLunch&id=${menu.UserName}"> ${menu.UserName}</a> </td>
                            <td>${menu.MenuID}</td>
                            <td>${menu.UploadDateTime}</td>
                            <td>${menu.TiffinDescription}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="footer_space"></div>
    </div> 
</body>
</html>
