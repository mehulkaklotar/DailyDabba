<%-- 
    Document   : search
    Created on : 8 Oct, 2013, 2:16:44 AM
    Author     : kaklo
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

            <!-- ******** GOOGLE MAP START ******** -->
            <article class="wrapper">
                <div class="row">
                    <div class="span12">
                        <h1 class="center">Contact Us</h1>
                        <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?q=23.1883,72.6281&amp;num=1&amp;t=m&amp;ie=UTF8&amp;z=14&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?q=23.1883,72.6281&amp;num=1&amp;t=m&amp;ie=UTF8&amp;z=14&amp;source=embed" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                    </div>
                </div>
                <!-- ******** GOOGLE END ******** -->

        </header>
        <!-- ******** RESERVATION START ******** -->
        <form name="contactform" method="post" action="" id="">
            <div align="center" class="row">
                <h2 class="center">Your Suggestion</h2>
                <div>
                    <input type="text" style="width:200px;" placeholder="Your Name" name="name">
                </div>
                <div style="margin-top: 10px;">
                    <input type="text" style="width:200px;" placeholder="Your E-Mail ID" name="email">
                </div>
                <div style="margin-top: 10px;">
                    <textarea style="width: 500px;" placeholder="Message" name="message"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="span12 center">
                    <input type="submit" value="Submit your Suggestion">
                </div>
            </div>
        </form>
        <!-- ******** RESERVATION END ******** -->
    </article>
    <jsp:include page="footer.jsp"></jsp:include>

    <button class="back-to-top">^</button>
</body>
</html>