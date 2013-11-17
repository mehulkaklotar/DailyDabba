<%-- 
    Document   : selectCategory
    Created on : 13 Oct, 2013, 3:05:19 PM
    Author     : Kiran
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

        <jsp:include page="include.jsp"></jsp:include>
            <style>
                .logo1 {
                    background:#2fbbb2;
                    border:1px solid #2fbbb2;
                    box-shadow: 0 0 5px rgba(0,0,0,0.2), inset 0 0 40px rgba(0,0,0,0.15);
                    left: 0;
                    text-align: center;
                    top: 0px;
                    width: 300px;
                    z-index: 2000;
                    color: #fff;
                }
            </style>

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

                <article class="wrapper" style="height: 400px;"> 
                <div class="row">
                    <div class="span12">
                        <hr>
                        <h2 class="center">Sign Up As</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>


                <form name="" method="post" action="" id="login">
                    <div align="center" class="row">
                        <a href="Controller?action=selectCustomer">
                            <div class="logo1"  style="float: left; margin-left: 175px">
                                <h2 style="color: #fff;">Customer</h2>

                            </div>
                        </a>
                        <a href="Controller?action=selectVendor">
                            <div class="logo1" style="float: right; margin-right: 175px ">
                                <h2 style="color: #fff;">Vendor</h2>
                            </div>
                        </a>
                    </div>
                </form>

                <button class="back-to-top">^</button>
            </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>
