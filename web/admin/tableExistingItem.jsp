<%-- 
    Document   : tableExistingItem
    Created on : Nov 6, 2013, 3:40:22 PM
    Author     : PRACHI
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
    <tr>
        <th>Item Name</th>
        <th>Type Name</th>
    </tr>
    <c:forEach items="${ItemList}" var="item">
        <tr>
            <td>${item.itemName}</td> 
            <td>${item.type.typeName}</td>
        </tr>
    </c:forEach>
</table>