<%-- 
    Document   : vendor_registration
    Created on : 14 Oct, 2013, 4:05:50 PM
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

            <article class="wrapper" style="margin-left: 40%"> 
                <div class="row">
                    <div class="span12">
                        <hr>
                        <h2>Vendor Registration</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>

                <form name="registrationForm" method="post" action="#" id="vendorRegister">
                    <div align="left" class="row">
                        <div>
                            <input type="text" style="width:auto;" placeholder="User Name" name="txtUsername" required="">
                            <span class="required">*</span>
                            <span class="required">Should be unique</span>
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Password" name="txtPassword">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Confirm Password" name="txtConfirmPassword">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="First Name" name="txtFirstname" >
                            <input type="text" style="width:auto;" placeholder="Last Name" name="txtLastname">
                        </div>

                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Mobile Number" name="txtMobileNumber">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Alternate Number" name="txtAlternateNumber">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Email ID" name="txtEmailID">
                        </div>
                        <br>
                        <div>
                            <h3> Tiffin Center address </h3>
                            <select id="State" class ="selectStyle">
                                <option value="1">State
                                </option>
                            </select>
                            <select id="City" class ="selectStyle">
                                <option value="1">City
                                </option>
                            </select>
                        </div>

                        <br>
                        <div>
                            <select id="Area" class ="selectStyle">
                                <option value="1">Area
                                </option>
                            </select>
                            <input type="text" style="width:auto;" placeholder="Landmark" name="txtLandmark">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Street Name" name="txtStreetName">
                            <input type="text" style="width:auto;" placeholder="Flat Number" name="txtFlatNumber" >

                        </div>
                        <br>

                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Pin Code" name="txtPincode">
                        </div>

                    </div>
                    <div class="row">
                        <div class="span6">
                            <input type="submit" value="Submit">
                        </div>
                    </div>
                </form>
                <button class="back-to-top">^</button>
            </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>
