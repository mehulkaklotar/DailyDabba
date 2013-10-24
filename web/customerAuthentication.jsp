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
                <form name="Authenticate" method="post" action="" id="authenticate">
                    <div align="center">
                        <p>DailyDibba just sent authentication code to your EmailID for varification</p>
                        
                    </div>
                    <div align="center">
                        <p>If you have not received yet, <a>Click Here</a></p>
                        <p>Enter you authentication code to activate your account</p>
                        <input type="text" style="width:auto;" placeholder="Authentication Code" name="txtAuthenticationCode">
                    <input type="submit" value="Submit"> 
                    </div>
                    
                    <hr style="width: 50%; margin: auto; margin-top: 10px;"></hr>
                </form>
            </div>
            <button class="back-to-top">^</button>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

