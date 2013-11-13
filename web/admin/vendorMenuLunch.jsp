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
                <label style="font-size: 200%"> Today's Lunch of ${param.id} </label>
            </div>
            <div style="margin-top: 20px; margin-left: 30px; margin-right: 30px">
                <table class="table" id="table_my_table">
                    <thead>
                        <tr style="font-family: cursive">
                            <th title="Click to sort Item ID wise"><label>Item ID</label></th>
                            <th title="Click to sort Item Name wise"><label>Item Name</label></th>
                            <th title="Click to sort Type wise"><label>Type</label></th>
                            <th title="Click to sort Cost wise"><label>Cost</label></th>
                            <th title="Click to sort Quantity wise"><label>Quantity</label></th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${menu}" var="menu">
                        <tr>
                            <td>${menu.ItemID}</td>
                            <td>${menu.ItemName}</td>
                            <td>${menu.TypeName}</td>
                            <td>${menu.Cost}</td>
                            <td>${menu.Quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="footer_space"></div>
    </div> 
</body>
</html>
