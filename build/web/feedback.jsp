<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<script src="js/../bootstrap/js/jqBootstrapValidation.js"></script>
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">
        <jsp:include page="include.jsp"></jsp:include>
        <script src="js/addFeedback.js"></script>


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
            <div style="margin: auto">
                <h2 class="center">Feedback</h2>
                <div class="message">
                    <div id="alert"></div>
                </div>
            </div>
            <hr></hr>
            <form name="contactform" method="post" action="" id="reservation">
                <div align="center" class="row">
                    <div>
                        <label> Vendor Name :  ${param['userName']} </label> 
                    </div>
                    <br></br>
                    <div>
                        <textarea style="width: 300px;" id="message" placeholder="Your Feedback" required name="message"></textarea>
                    </div>
                    <div>
                        <label> Give your rating : </label> 
                    </div>
                    <div style="margin-top: 10px">
                        <input type="text" required name="rating" id="rating" required placeholder="rating"  style="width: 20%; height: 5%"></input> 
                    </div>
                    <div>
                        <button class="btn btn-primary" type="button" onclick="addFeedback('${param['userName']}')">Submit your Feedback</button>
                    </div>
                </div>
            </form>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

