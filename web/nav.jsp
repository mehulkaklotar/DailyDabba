<script type = "text/javascript" >

    function preventBack() {
        window.history.forward();
    }

    setTimeout("preventBack()", 0);

    window.onunload = function() {
        null
    };

</script>
<nav class="main">

    <ul>
        <li class="active"><a href="Controller?action=getIndex">Home</a></li>
        <li><a href="aboutUs.jsp">About Us</a></li>
        <!--<ul>
          <li><a href="typography.html">Typography</a></li>
          <li><a href="columns.html">Columns</a>
            <ul>
              <li><a href="#">Submenu Level 2</a></li>
              <li><a href="#">Submenu Level 2</a></li>
              <li><a href="#">Submenu Level 2</a></li>
              <li><a href="#">Submenu Level 2</a></li>
            </ul>
          </li>
          <li><a href="tables.html">Tables</a></li>
          <li><a href="gallery-3columns.html">Gallery - 3 Columns</a></li>
          <li><a href="gallery-4columns.html">Gallery - 4 Columns</a></li>
          <li><a href="videos.html">Videos</a></li>
          <li><a href="tabs.html">Tabs &amp; Accordion</a></li>
        </ul>-->

        <% if (session.getAttribute("UserName") == null) {%><li><a href="login.jsp?from=${pageContext.request.requestURI}">Login</a></li> <% }%>
        <% if (session.getAttribute("UserName") == null) {%><li><a href="selectCategory.jsp">Sign Up</a></li> <% }%>
        <% if (session.getAttribute("UserName") != null) {%>
        <li><a href="Controller?action=getOrderHistory">Order History</a></li>
        <li><a href="Controller?action=getProfileDetailsCustomer">Update Profile</a></li>
        <li><a href="changePassword.jsp">Change Password</a></li>
        <% }%>
        <li><a href="contact.jsp">Contact Us</a></li>
    </ul>
</nav>
