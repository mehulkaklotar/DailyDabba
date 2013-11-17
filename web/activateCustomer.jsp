<%-- 
    Document   : activate
    Created on : 17 Nov, 2013, 11:22:44 PM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    window.location.href = 'Controller?action=activateCustomer&username=<%= request.getParameter("username") %>';
</script>
