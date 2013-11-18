<%-- 
    Document   : verification
    Created on : 14 Oct, 2013, 10:20:01 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />
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
                <div class="row">
                    <div class="span12">
                        <hr>
                        <h2 class="center">Verification</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>
                <label class="center alert">Verify your account by your registered mobile no or check the email you provided for registration.</label>
            <% if(request.getAttribute("Message")!=null) { %><span class="alert-block">${Message}</span> <% } %>

            <form name="VerificationForm" method="post" action="Controller?action=verify&from=index.jsp" id="verification">
                <input type="hidden" value="<%= request.getParameter("username") %>" name="username" id="username"/>
                <div align="center" class="row">
                    <div>
                        <input type="text" style="width:auto;" placeholder="Verification Code" name="verificationCode">
                    </div>

                    <div class="row">
                        <div class="span12 center">
                            <input type="submit" value="Verify">
                        </div>
                    </div>
            </form>
            <button class="back-to-top">^</button>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

