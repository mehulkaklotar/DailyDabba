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
        <select id="ddlArea" class ="selectStyle">
            <c:forEach items="${areas}" var="area">
                <option value="${area.areaID}">${area.areaName}</option>
            </c:forEach>
        </select>
    </c:when>
    <c:otherwise>
        <select id="ddlArea" class ="selectStyle">
            <option value="0">Select Area</option>
        </select>
    </c:otherwise>
</c:choose>

