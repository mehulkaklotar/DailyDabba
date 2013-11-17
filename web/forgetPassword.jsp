<%-- 
    Document   : forgetPassword
    Created on : 13 Oct, 2013, 3:04:42 PM
    Author     : Kiran
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
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

        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">

        <jsp:include page="include.jsp"></jsp:include>
            <script>
                var b = new Boolean(true);
                function checkemail() {
                    if ($('#email').val() != "") {
                        var pattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                        if (!pattern.test($('#email').val())) {
                            $('#alertEmail').html("Invalid Email");
                            b = false;
                        }
                        else {
                            $('#alertEmail').html("Gr8!!");
                            b = true;
                            return true;
                        }
                    }
                }

                function checkmobile() {
                    if ($('#txtPhnNum').val() != "") {
                        var pattern = /^[789]\d{9}$/;
                        if (!pattern.test($('#txtPhnNum').val())) {
                            $('#alertMobile1').html("Invalid Mobile");
                            b = false;
                        }
                        else {
                            $('#alertMobile1').html("Yoo!!");
                            b = true;
                            return true;
                        }
                    }
                }
                function checkrequired() {
                    if ($('#txtPhnNum').val() === "" && $('#email').val() === "")
                    {
                        $('#alertForgetPassword').html("Please enter either your mobile number or your EmailID");
                        b = false;
                    }
                    else {

                        b = true;
                        return true;
                    }
                }

            </script>
            <style>
                .forgetpassword {
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
                <ul class="breadcrumb">
                <li><a href="Controller?action=getIndex">Home</a> <span class="divider">/</span></li>
                <lii class="active">forgot password</li>
            </ul>

                <div class="forgetpassword">
                    <div style="margin-left: 20px;">
                        <div style="padding-top: 20px;padding-bottom: 10px;">
                            <span id="alertForgetPassword" class="alert-danger"></span>
                        </div>
                        <div align="left" class="row">
                            <br></br>
                            <div>
                                <input type="text" style="width:auto;" onkeyup="checkmobile();" placeholder="Your Phone Number" name="txtPhnNum" id="txtPhnNum" required>
                                <span id="alertMobile1" class="alert">Valid mobile no only</span>
                                <span style="margin-left: 25px;" class="alert-info">Enter 10 digit number only </span>
                            </div>
                            <div>
                                <input type="email" style="width:auto;" onkeyup="checkemail();" placeholder="Your email" name="email" id="email" required>
                                <span id="alertEmail" class="alert">Valid Email Address only</span>

                            </div>
                            <div style="margin-top: 10px">
                                <div align="center" style="margin-top: 10px;">
                                    <button class="btn btn-primary" type="submit" onclick="checkrequired();">Change it!!</button>

                                </div>
                            </div>

                        </div>
                    </div>
            </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>
