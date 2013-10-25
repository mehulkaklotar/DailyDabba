<%-- 
    Document   : updateProfileVendor
    Created on : Oct 25, 2013, 12:57:33 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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


                <div class="row">
                    <div class="span12">
                        <hr>
                        <h2>Vendor Registration</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>

                <form name="updateProfileVendorForm" method="post" action="#" id="updateProfileVendor">
                    <div align="left" class="row">
                        <div>
                            <input type="text" style="width:auto;" placeholder="User Name" name="txtUsername" required="">
     
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="First Name" name="txtFirstname" >
                            <input type="text" style="width:auto;" placeholder="Last Name" name="txtLastname">
                        </div>
                        
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Mobile Number" name="txtMobileNumber">
                        <input type="text" style="width:auto;" placeholder="Alternate Number" name="txtAlternateNumber">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Email ID" name="txtEmailID">
                        </div>
                        <br>
                        <div>
                            <h3> Tiffin Center address </h3>
                             <select id="City" class ="selectStyle">
                                <option value="1">City
                                </option>
                            </select>
                        
                            <select id="Area" class ="selectStyle">
                                <option value="1">Area
                                </option>
                            </select>
                        </div>
                        <br>
                        <div>
                            <textarea style="width:300px;" placeholder="Address" id="txtAdressVendor"></textarea>           
                        </div>
                        <br>

                    </div>
                    <div class="row">
                        <div class="span6">
                            <input type="submit" value="Update">
                        </div>
                    </div>
                </form>
                <button class="back-to-top">^</button>
            </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

