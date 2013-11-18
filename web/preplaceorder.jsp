<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<html>
    <head>
        <script type="text/javascript">
            function initialize() {
                window.location.href = "Controller?action=postplaceorder&orderID=<%= request.getAttribute("orderID") %>&vendorUN=<%= request.getAttribute("vendorUN") %>&tiffinCost=<%= request.getAttribute("tiffinCost") %>";
            }
        </script>
    </head>
    <body onload="initialize()">

    </body>
</html>