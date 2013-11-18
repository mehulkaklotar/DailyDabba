<%-- 
    Document   : areaList
    Created on : Oct 29, 2013, 6:28:15 PM
    Author     : PRACHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${!empty areas}">
            <c:forEach items="${areas}" var="area">
                <option value="${area.areaID}">${area.areaName}</option>
            </c:forEach>
    </c:when>
    <c:otherwise>
            <option value="0">Select Area</option>
    </c:otherwise>
</c:choose>


