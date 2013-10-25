<%-- 
    Document   : successfulUpdationofMenu
    Created on : Oct 24, 2013, 10:31:30 AM
    Author     : PRACHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Object res=request.getAttribute("result");
        %>
        <label name="lblResult" id="lblResult"><%= res.toString() %></label>
    </body>
</html>
