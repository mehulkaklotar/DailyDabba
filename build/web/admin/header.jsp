<%
    if (session.getAttribute("UserName") == null) {
%>
<jsp:forward page="/DailyDibba/login.jsp?from=${pageContext.request.requestURI}"></jsp:forward>
<%    }
%>
<script>
    
    $(document).ready(function() {
        $.ajax({
            url: "/DailyDibba/admin/AdminController?action=getUnreadSuggestionCount",
        }).done(function(result) {
            $('#unreadSuggestionCount').html(result);
        });
    });
</script>
<header>
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="main-logo"><a href="index.jsp"><img src="admin/img/beoro_logo.png" alt="Beoro Admin"></a></div>
            </div>
            <div class="span5">
                <nav class="nav-icons">
                    <ul>
                        <li><a href="/DailyDibba/admin/index.jsp" class="ptip_s" title="Dashboard"><i class="icsw16-home"></i></a></li>
                                <%
                                    if (session.getAttribute("Role").equals("Admin")) {
                                %>
                        <li><a href="/DailyDibba/admin/AdminController?action=getSuggestions" class="ptip_s" title="Suggestions"><i class="icsw16-mail"></i><span class="badge badge-info" id="unreadSuggestionCount"></span></a></li>
                        <li><a href="request.jsp" class="ptip_s" title="Requests"><i class="icsw16-speech-bubbles"></i><span class="badge badge-important">14</span></a></li>
                                    <% } %>
                        <li><a href="#" class="ptip_s" title="Change Password"><i class="icsw16-cog"></i></a></li>
                        
                    </ul>
                </nav>
            </div>
            <div class="span4">
                <div class="user-box">
                    <div class="user-box-inner">
                        <img src="admin/img/avatars/avatar.png" alt="" class="user-avatar img-avatar">
                        <div class="user-info">
                            Welcome, <strong>
                                <a href="<%
                                    if (!session.getAttribute("Role").equals("Admin")) {
                                %>/DailyDibba/admin/updateProfileVendor.jsp 
                                <% } else { %>
                                # <% } %>"><%= session.getAttribute("UserName") %></a></strong>
                            <ul class="unstyled">
                                <li>&middot;</li>
                                <li><a href="/DailyDibba/Controller?action=logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
