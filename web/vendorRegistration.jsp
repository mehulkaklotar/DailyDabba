<%-- 
    Document   : vendor_registration
    Created on : 14 Oct, 2013, 4:05:50 PM
    Author     : sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dailydibba.model.*" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dabba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">
        
        <script>
        function myFunction() {
            
        var pass1 = document.getElementById("pass1").value;
        var pass2 = document.getElementById("pass2").value;
        if (pass1 != pass2) {
            alert("Passwords Do not match");
            document.getElementById("pass1").style.borderColor = "#E34234";
            document.getElementById("pass2").style.borderColor = "#E34234";
            window.location.href = 'Controller?action=selectVendor'
        }
        else{
            window.location.href = 'Controller?action=vendorRegistration'
        }
    }
</script>

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
                        <h2>Daily Dabba</h2>
                        <!--<img src="images/daily-dibba.png" width="150" height="120"/>-->
                        <p>Eat Healthy, Live Healthy</p>
                        <a href="index.jsp"></a> </div>
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

                <form name="registrationForm" method="post" action="Controller?action=vendorRegistration" id="vendorRegister" >
                    <div align="left" class="row">
                        <div>
                            <input type="text" style="width:auto;" placeholder="User Name" name="txtUsername" required="">
                            <span class="required">*</span>
                            <span class="required">Should be unique</span>
                        </div>
                        <br>
                        <div>
                            <input type="password"  id="pass1" style="width:auto;" placeholder="Password" name="txtPassword">
                        </div>
                        <br>
                        <div>
                            <input type="password" id="pass2" style="width:auto;" placeholder="Confirm Password" name="txtConfirmPassword">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Vendor Name" name="txtVendorname" >
                        </div>
                        <br>
                        
                        <div>
                            <input type="text" style="width:auto;" placeholder="Owner Name" name="txtOwnername">
                        </div>
                        
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Mobile Number" name="txtMobileNumber">
                        </div>
                        <br>
                        <div>
                            <input type="text" style="width:auto;" placeholder="Landline Number" name="txtLandlineNumber">
                        </div>
                        <br>
                        <div>
                            <input type="email" style="width:auto;" placeholder="Email ID" name="txtEmailID">
                        </div>
                        <br>
                        <div>
                            <h3> Tiffin Center address </h3>

                            <select id="ddlCity" name="ddlCity" class ="selectStyle">
                                <option>Select City</option>
                                        <c:forEach items="${Cities}" var="city">
                                          
                                                    <option value="${city.cityID}" >${city.cityName}</option>
                                            
                                        </c:forEach>
                                    </select>
                        </div>
                         <div id="areaDiv">
                            <select id="listArea" class ="selectStyle">
                              <option>Select Area</option>
                          
                            </select>
                        </div>
                        
                          <div>
                            <input type="text" style="width:auto;" placeholder="Landmark" name="txtLandmark">
                            <input type="text" style="width:auto;" placeholder="Street Name" name="txtStreetName">
                            <input type="text" style="width:auto;" placeholder="Flat Number" name="txtFlatNumber" >
                            
                        </div>
                        <br>
                        
                    </div>
                    <div class="row">
                        <div class="span6">
                            <input type="submit" value="Submit" onclick="myFunction()">
                        </div>
                    </div>
                </form>
                <button class="back-to-top">^</button>
            </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>