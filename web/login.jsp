<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">

        <jsp:include page="include.jsp"></jsp:include>


        </head>

        <body class="home">
            <header>
                <div class="nav-bar">
                    <div class="nav-inside"> </div>
                </div>
                <div class="wrapper"> 

                    <!-- ******** LOGO START ******** -->
                    <div class="logo">
                        <h2>Daily Dibba</h2>
                        <!--<img src="images/daily-dibba.png" width="150" height="120"/>-->
                        <p>Eat Healthy, Live Healthy</p>
                        <a href="index.html"></a> </div>
                    <!-- ******** LOGO END ******** -->

                    <!-- ******** NAVIGATION START ******** -->

                <jsp:include page="nav.jsp"></jsp:include>

                    <button class="nav-trigger">Navigation</button>

                    <!-- ******** NAVIGATION END ******** --> 

                    <div class="labelWelcome">
                        <span>Welcome, Guest</span>
                    </div>
                </div>
                <!-- ******** FULL WIDTH SLIDER START ******** -->
                <div id="fwslider">
                    <div class="slider_container">

                        <div class="slide" style="height:300px;" > 
                            <img src="images/thali.JPG" />

                        </div>

                        <div class="slide" style="height:300px;"> 
                            <img src="images/thali1.jpg" />

                        </div>

                        <div class="slide" style="height:300px;"> 
                            <img src="images/thali2.jpg" />

                        </div>

                    </div>


                    <div class="timers"></div>
                    <div class="slidePrev"><span></span></div>
                    <div class="slideNext"><span></span></div>
                </div> 
                <div style="height:20px;background-color: #222;">

                </div>
                <!-- ******** FULL WIDTH SLIDER END ******** -->

            </header>

            <article class="wrapper"> 
                <div style="height: 2%">

                </div>
                <div>
                    <div style="margin: auto">
                        <h2 class="center">Log In</h2>
                    </div>
                <%
                    if (request.getParameter("vendorUN") != null) {
                %>
                <form name="loginForm" method="post" action="Controller?action=login&from=<%= request.getParameter("from")%>&vendorUN=<%= request.getParameter("vendorUN")%>" id="login">
                    <%
                    } else {
                    %>
                    <form name="loginForm" method="post" action="Controller?action=login&from=<%= request.getParameter("from")%>" id="login">
                        <%
                            }
                        %>
                        <div align="center">
                            <div>
                                <span class="error"><% if (request.getAttribute("Message") != null) {
                                        out.print(request.getAttribute("Message"));
                                    }%></span>
                            </div>
                            <div>
                                <input type="text" required name="username" placeholder="User Name"  style="width: 20%; height: 5%"></input> 
                            </div>

                            <div>
                                <input type="text" required name="password" placeholder="Password"  style="width: 20%; height: 5%"></input>
                            </div>
                        </div>
                        <div align="center">
                            <input type="submit" name="" value="Sign In"></input>
                            <span> <a href="forgetPassword.jsp"> &nbsp; Forgot Password ? </a></span>
                        </div>
                        <hr style="width: 50%; margin: auto; margin-top: 10px;"></hr>
                    </form>
                    <div align="center">
                        <div><span>Not a member yet?</span></div>
                        <input type="submit" name="" value="Sign Up" onclick="window.location.href = 'selectCategory.jsp'" style="margin-top: 10px;"></input>
                    </div>
            </div>
            <button class="back-to-top">^</button>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

