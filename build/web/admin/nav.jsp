<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <div class="pull-right top-search">
                <form action="#" >
                    <input type="text" name="q" id="q-main">
                    <button class="btn"><i class="icon-search"></i></button>
                </form>
            </div>
            <div id="fade-menu" class="pull-left">
                <ul class="clearfix" id="mobile-nav">
                    <%
                        if (session.getAttribute("Role").equals("Vendor")) {
                    %>
                    <li>
                        <a href="updatemenu.jsp">Menu</a>

                    </li>
                    <% }%>
                    <%
                        if (session.getAttribute("Role").equals("Vendor") || session.getAttribute("Role").equals("Admin")) {
                    %>
                    <li><a href="orders.jsp">Orders</a>
                        <%
                            if (session.getAttribute("Role").equals("Vendor")) {
                        %>
                        <ul>
                            <li><a href="neworders.jsp">New Orders</a></li>
                        </ul>
                        <% }%>
                    </li>
                    <% }%>
                    <li><a href="">Items</a>
                        <ul>
                            <li><a href="addItem.jsp">Add Item</a></li>

                        </ul>
                    </li>
                    <%
                        if (session.getAttribute("Role").equals("Admin")) {
                    %>
                    <li><a href="viewFeedback.jsp">Feedbacks</a>

                    </li>
                    <li><a href="users.jsp">Users</a>
                        
                    </li>
                    <li><a href="AdminController?action=getAllVendors">Vendors</a>

                    </li>
                    <li><a href="AdminController?action=getAllCity">City</a>
                        <ul>
                            <li><a href="addCity.jsp">Add City</a></li>

                        </ul>
                    </li>
                    <li><a href="area.jsp">Area</a>
                        <ul>
                            <li><a href="AdminController?action=getAllCityArea">Add Area</a></li>

                        </ul>
                    </li>
                    <% }%>
                </ul>
            </div>
        </div>
    </div>
</div>
