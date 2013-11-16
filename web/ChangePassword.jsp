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
        <script>
     $(document).ready(function() {
                    var b = new Boolean(true);
                    
     });        
     function checkold()
     {
          if ($('#txtOldPass').val() == "") {
              $('#alertOldPass').html("Please enter your old password");
                        b = false;
                        return;

          }
       
     }
      function checknew()
     {
          if ($('#txtNewPass').val() == "") {
              $('#alertNewPass').html("Please enter your new password");
                        b = false;
                        return;

          }
       
     }
      function checknew1()
     {
          if ($('#txtNewPass1').val() == "") {
              $('#alertNewPass1').html("Please enter your new password again");
                        b = false;
                        return;

          }
       
     }
      function checkPassword() {
                    
                    if ($('#txtNewPass').val() != "") {
                        var pattern = /^[A-Za-z0-9!@#$%^&*()_]{6,20}$/;
                        if (!pattern.test($('#txtNewPass').val())) {
                            $('#alertNewPass').html("Invalid Password");
                            b = false;
                        }
                        else {
                            $('#alertNewPass').html("Perfect!!!!");
                            b = true;
                            return true;
                        }
                    }
                }

     function comparepassword() {
                    var pass2 = $('#txtNewPass').val();
                    var pass1 = $('#txtNewPass1').val();
                    if (pass1 != pass2) {
                        $('#alertNewPass1').html("password do not match");
                        b = false;
                        return;
                    }
                    else {
                        $('#alertNewPass1').html("Perfect!!");
                        b = true;
                        return true;
                    }
                }
 function checkrequired()
 {
     checkold();
     checknew();
     checknew1();
 }
        </script>
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

  
     <script src="js/commonTask.js"></script>
        <script src="js/jqBootstrapValidation.js"></script>

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
                                <ul class="breadcrumb">
                    <li><a href="Controller?action=getIndex">Home</a> <span class="divider">/</span></li>
                    <lii class="active">Change Password</li>
                </ul>
     

                 <div class="changepassword">
                       <div style="margin-left: 20px;">
                        <div style="padding-top: 20px;padding-bottom: 10px;">
                            <span id="alertChangePassword" class="alert" style="display: none;color: #C60F13;"></span>
                        </div>
                           <div align="left" class="row">
                    <br></br>
                    <div>
                        <input type="password" style="width:auto;" placeholder="Old Password" name="txtOldPass" id="txtOldPass" required>
                                    <span id="alertOldPass" class="alert"></span>

                    </div>
                      <div>
                          <input type="password" style="width:auto;" placeholder="New Password" onkeyup="checkPassword();" name="txtNewPass" id="txtNewPass" required>
                                    <span id="alertNewPass" class="alert"></span>
                   
                      </div>
                    <div>
<input type="password" style="width:auto;" onkeyup="comparepassword();" placeholder="Retype New Password"  name="txtNewPass1" id="txtNewPass1" required>
                                    <span id="alertNewPass1" class="alert"></span>
                   
                      </div>
                    <div style="margin-top: 10px">
                    <div align="left" style="margin-top: 10px;">
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
