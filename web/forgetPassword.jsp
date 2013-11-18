<%-- 
    Document   : ChangePassword
    Created on : Nov 16, 2013, 5:45:23 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<script src="js/../bootstrap/js/jqBootstrapValidation.js"></script>
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

<html>
    <head>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="js/commonTask.js"></script>
        <jsp:include page="include.jsp"></jsp:include>
        <script src="bootstrap/js/jqBootstrapValidation.js"></script>
        <style>
            .changepassword {
                width: auto;
                padding-left: 20px;
                padding-right: 20px;
                background-color: #fff;
                text-align: left;
                border: 1px solid #e5e5e5;
                -webkit-border-radius: 5px;
                -moz-border-radius: 5px;
                border-radius: 5px;
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
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
    </div>

    <article class="wrapper"> 
        <ul class="breadcrumb">
            <li><a href="Controller?action=getIndex">Home</a> <span class="divider">/</span></li>

            <lii class="active">Forgot Password</li>
        </ul>


        <div class="changepassword">


            <form class="form-horizontal" action="Controller?action=forgotPassword" method="post">


                <div class="control-group" style="width: 40%;padding-top: 20px;">
                    <div class="controls">
                        <span class="alert" style="color: #C60F13;">
                            Type your Username
                        </span>
                        <span>
                             <br><br>
                            </span>
                         <span class="alert" style="color: #C60F13;">
                            To reset your password
                        </span>
                    </div>
                </div>
                <div class="control-group" style="width: 40%;">
                    <div class="controls">
                        <input type="text" placeholder="Username" name="txtUserName" id="txtUserName" required>
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group" style="width: 40%;">
                    <div class="controls">
                        <input type="submit" class="btn" value="Send Password" />
                    </div>
                </div>
            </form>


    </article>


    <jsp:include page="footer.jsp"></jsp:include>

    <button class="back-to-top">^</button>
</body>
</html>
