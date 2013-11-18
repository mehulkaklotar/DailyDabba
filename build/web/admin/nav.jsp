<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            
            <div id="fade-menu" class="pull-left">
                <ul class="clearfix" id="mobile-nav">
                    <%
                        if (session.getAttribute("Role").equals("Vendor")) {
                    %>
                    <li>
                        <a href="/DailyDibba/admin/updatemenu.jsp">Menu</a>

                    </li>
                    <% }%>
                    <%
                        if (session.getAttribute("Role").equals("Vendor") || session.getAttribute("Role").equals("Admin")) {
                    %>
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllOrdersForVendor">Orders</a>
                        <%
                            if (session.getAttribute("Role").equals("Vendor")) {
                        %>
                        <ul>
                            <li><a href="/DailyDibba/admin/AdminController?action=getVendorLunchList">Lunch Orders<span class="badge badge-info">6</span></a></li>
                            <li><a href="/DailyDibba/admin/AdminController?action=getVendorDinnerList">Dinner Orders<span class="badge badge-info">6</span></a></li>
                        </ul>
                        <% }%>
                    </li>
                    <li><a href="/DailyDibba/admin/AdminController?action=getDeliveryArea">My Delivery Areas</a>
                        <ul>
                            <li><a href="/DailyDibba/admin/AdminController?action=getAddDeliveryArea">Add New Delivery Area</a></li>
                        </ul>
                    </li>
                    <% }%>
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllItemsByVendor">Menu Items</a>
                        <ul>
                            <li><a href="/DailyDibba/admin/addItem.jsp">Add Menu Item</a></li>

                        </ul>
                    </li>
                    
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllType">Item Type</a>
                        
                    </li>
                    <%
                        if (session.getAttribute("Role").equals("Admin")) {
                    %>
                    <li><a href="/DailyDibba/admin/AdminController?action=getFeedbackList">Feedbacks</a>

                    </li>
                    <li><a href="/DailyDibba/admin/AdminController?action=getCustomerList">Customers</a>

                    </li>
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllVendors">Vendors</a>

                    </li>
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllCity">City</a>
                        <ul>
                            <li><a href="/DailyDibba/admin/addCity.jsp">Add City</a></li>

                        </ul>
                    </li>
                    <li><a href="/DailyDibba/admin/AdminController?action=getAllArea">Area</a>
                        <ul>
                            <li><a href="/DailyDibba/admin/AdminController?action=getAllCityArea">Add Area</a></li>

                        </ul>
                    </li>
                    <li><a href="#">Reports</a>
                        <ul>
                            <li><a href="/DailyDibba/admin/AdminController?action=getVendorReport">Vendors</a></li>
                            <li><a href="/DailyDibba/admin/AdminController?action=getAllUsers">Customers</a></li>
                            <li><a href="/DailyDibba/admin/AdminController?action=getAllOrder">Orders</a></li>
                            <li><a href="/DailyDibba/admin/AdminController?action=getTodayAllLunch">Today's All Lunch</a>
                            </li>
                            <li><a href="/DailyDibba/admin/AdminController?action=getTodayAllDinner">Today's All Dinner</a>
                            <li><a href="/DailyDibba/admin/AdminController?action=getAllFeedback">Feedbacks</a>
                        </ul>
                    </li>
                    <% }%>
                </ul>
            </div>
        </div>
    </div>
</div>
