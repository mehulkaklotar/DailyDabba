 <%
            response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
        %>
<header>
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="main-logo"><a href="index.jsp"><img src="admin/img/beoro_logo.png" alt="Beoro Admin"></a></div>
            </div>
            <div class="span5">
                <nav class="nav-icons">
                    <ul>
                        
                                <%
                                    if (session.getAttribute("Role").equals("Admin")) {
                                %>
                        <li><a href="suggestion.jsp" class="ptip_s" title="Suggestions"><i class="icsw16-mail"></i><span class="badge badge-info">6</span></a></li>
                        <li><a href="request.jsp" class="ptip_s" title="Requests"><i class="icsw16-speech-bubbles"></i><span class="badge badge-important">14</span></a></li>
                        <% } %>
                        <li><a href="javascript:void(0)" class="ptip_s" title="Settings"><i class="icsw16-cog"></i></a></li>
                    </ul>
                </nav>
            </div>
            <div class="span4">
                <div class="user-box">
                    <div class="user-box-inner">
                        <img src="admin/img/avatars/avatar.png" alt="" class="user-avatar img-avatar">
                        <div class="user-info">
                            Welcome, <strong><a href="profile.jsp">Jonathan</a></strong>
                            <ul class="unstyled">
                                <li><a href="profile.jsp">Settings</a></li>
                                <li>&middot;</li>
                                <li><a href="login.html">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
