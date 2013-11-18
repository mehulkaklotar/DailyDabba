<%-- 
    Document   : checkusername
    Created on : 12 Nov, 2013, 2:17:13 PM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(request.getAttribute("Response").equals("Available"))
            {
        %>
        Available
        <%
    }
    else
    {
        %>
        Unavailable
        <%
    }
        %>
    </body>
</html>
