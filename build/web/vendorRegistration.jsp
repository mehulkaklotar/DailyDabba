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
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />
        <meta charset="UTF-8">
        <title>Daily Dabba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">
        <jsp:include page="include.jsp"></jsp:include>
            <script>

                $(document).ready(function() {
                    var b = new Boolean(true);
                    $('#ddlCityVendor').change(function() {
                        $.ajax({
                            url: "Controller?action=getAllAreaByCity&cityID=" + $('#ddlCityVendor').val(),
                        }).done(function(result) {
                            $('#ddlArea').html(result);
                        });
                    });

                });

                function checkUsername() {
                    if ($('#txtUsername').val() == "") {
                        $('#usernameunique').html("Username Can't be empty");
                        b = false;
                        return;
                    }
                    else if ($('#txtUsername').val() != "") {
                        var pattern = /^[A-Za-z0-9_]{3,30}$/;
                        if (!pattern.test($('#txtUsername').val())) {
                            $('#usernameunique').html("Invalid UserName");
                            b = false;
                        }
                        else {
                            $.ajax({
                                url: "Controller?action=checkUsername&username=" + $('#txtUsername').val(),
                            }).done(function(result) {
                                $('#usernameunique').html(result);
                                b = true;
                            });
                        }
                    }
                }

                function checkPassword() {
                    if ($('#password').val() == "") {
                        $('#alertPassword').html("password Can't be empty");
                        b = false;
                        return;
                    }
                    else if ($('#password').val() != "") {
                        var pattern = /^[A-Za-z0-9!@#$%^&*()_]{6,20}$/;
                        if (!pattern.test($('#password').val())) {
                            $('#alertPassword').html("Invalid Password");
                            b = false;
                        }
                        else {
                            $('#alertPassword').html("Valid");
                            b = true;
                            return true;
                        }
                    }
                }

                function comparepassword() {
                    var pass2 = $('#confirmpassword').val();
                    var pass1 = $('#password').val();
                    if (pass1 != pass2) {
                        $('#alertPassword').html("password do not match");
                        b = false;
                        return;
                    }
                    else {
                        $('#alertPassword').html("Valid");
                        b = true;
                        return true;
                    }
                }

                function checkemail() {
                    if ($('#txtEmailID').val() != "") {
                        var pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i;
                        if (!pattern.test($('#txtEmailID').val())) {
                            $('#alertEmail').html("Invalid Email");
                            b = false;
                        }
                        else {
                            $('#alertEmail').html("Valid");
                            b = true;
                            return true;
                        }
                    }
                }

                function checkmobile() {
                    if ($('#txtMobileNumber').val() != "") {
                        var pattern = /^\d{10}$/;
                        if (!pattern.test($('#txtMobileNumber').val())) {
                            $('#alertMobile').html("Invalid Mobile");
                            b = false;
                        }
                        else {
                            $('#alertMobile').html("Valid");
                            b = true;
                            return true;
                        }
                    }
                }

                function vendorRegister() {

                    if (b == false) {
                        $('#alertRegisterVendor').attr("style", "color: #C60F13;margin: 20px 0 0 20px;");
                        $('#alertRegisterVendor').html("Please provide correct details !!!");
                    } else {
                        var pass2 = $('#confirmpassword').val();
                        var pass1 = $('#password').val();
                        if (pass1 != pass2) {
                            $('#alertPassword').html("password do not match");
                            b = false;
                            return;
                        }
                        else {
                            if (b != false) {
                                $.post("Controller?action=vendorRegistration", {
                                    username: $('#txtUsername').val(),
                                    password: $('#password').val(),
                                    vendorname: $('#txtVendorname').val(),
                                    ownername: $('#txtVendorname').val(),
                                    mobileno: $('#txtMobileNumber').val(),
                                    landlineno: $('#txtLandlineNumber').val(),
                                    emailID: $('#txtEmailID').val(),
                                    city: $('#ddlCityVendor').val(),
                                    area: $('#ddlArea').val(),
                                    landmark: $('#txtLandmark').val(),
                                    street: $('#txtStreetName').val(),
                                    flat: $('#txtFlatNumber').val(),
                                },
                                        function(response) {
                                            if ($.trim(response) == 'success') {
                                                setTimeout("verification()", 2000);
                                            } else {
                                                alertMessage("error", "Invalid Usename and password!!!");
                                            }
                                        });
                            }
                            else {
                                $('#alertRegisterVendor').attr("style", "color: #C60F13;margin: 20px 0 0 20px;");
                                $('#alertRegisterVendor').html("Please provide correct details !!!");
                            }
                        }
                    }
                }

                function verification() {
                    window.location.href = "verificationVendor.jsp?username=" + $('#txtUsername').val();
                }

            </script>
            <style>
                .vendorregistration {
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
                        <h2>Daily Dabba</h2>
                        <!--<img src="images/daily-dibba.png" width="150" height="120"/>-->
                        <p>Eat Healthy, Live Healthy</p>
                        <a href="Controller?action=getIndex"></a> </div>
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
                    <li><a href="selectCategory.jsp">Select Registration</a> <span class="divider">/</span></li>
                    <lii class="active">Vendor Registration</li>
                </ul>

                <div class="vendorregistration">
                    <div style="margin-left: 20px;">
                        <div style="padding-top: 20px;padding-bottom: 10px;">
                            <span id="alertRegisterVendor" class="alert" style="display: none;color: #C60F13;"></span>
                        </div>

                        <!--<form name="registrationForm" method="post" action="" id="vendorRegister" > -->
                        <div align="left" class="row">
                            <div>
                                <input type="text" onkeyup="checkUsername();" style="width:auto;" placeholder="User Name" id="txtUsername" name="txtUsername" required="">
                                <span class="required">*</span>
                                <span id="usernameunique" class="alert">Should be unique</span>
                                <span style="margin-left: 25px;" class="alert-info">alphabets or numbers, no special characters, min 3 and max 30 </span>
                            </div>
                            <br>
                            <div>
                                <input type="password" onkeyup="checkPassword();" required  id="password" style="width:auto;" placeholder="Password" name="txtPassword">
                                <input type="password" onkeyup="comparepassword();" required id="confirmpassword" style="width:auto;" placeholder="Confirm Password" name="txtConfirmPassword">
                                <span id="alertPassword" class="alert">Password should match</span>
                                <span style="margin-left: 25px;" class="alert-info">special characters and min length 6 max 20 charters. </span>
                            </div>
                            <br>
                            <div>
                                <input type="text" id="txtVendorname" required style="width:auto;" placeholder="Vendor Name" name="txtVendorname" >
                                <input type="text" id="txtOwnername" required style="width:auto;" placeholder="Owner Name" name="txtOwnername">
                            </div>

                            <br>
                            <div>
                                <input type="text" onkeyup="checkmobile();" id="txtMobileNumber" style="width:auto;" placeholder="Mobile Number" name="txtMobileNumber">
                                <input type="text" id="txtLandlineNumber" style="width:auto;" placeholder="Landline Number" name="txtLandlineNumber">
                                <span id="alertMobile" class="alert">Valid mobile no only</span>
                            </div>
                            <br>
                            <div>
                                <input type="email" onkeyup="checkemail();" id="txtEmailID" style="width:auto;" placeholder="Email ID" name="txtEmailID">
                                <span id="alertEmail" class="alert">Valid Email Address only</span>
                            </div>
                            <br>
                            <div>
                                <h3> Tiffin Center address </h3>

                                <div>
                                    <input type="text" style="width:auto;" id="txtFlatNumber" placeholder="Flat Number" name="txtFlatNumber" >
                                    <input type="text" style="width:auto;" id="txtStreetName" placeholder="Street Name" name="txtStreetName">
                                    <input type="text" style="width:auto;" id="txtLandmark" placeholder="Landmark" name="txtLandmark">
                                </div>
                                <select id="ddlCityVendor" name="ddlCityVendor" class ="selectStyle">
                                    <option>Select City</option>
                                <c:forEach items="${Cities}" var="city">

                                    <option value="${city.cityID}" >${city.cityName}</option>

                                </c:forEach>
                            </select>
                        </div>
                        <div id="areaDiv">
                            <select id="ddlArea" class ="selectStyle">
                                <option>Select Area</option>

                            </select>
                        </div>


                        <br>

                    </div>
                    <div class="row">
                        <div class="span6">
                            <input type="submit" value="Submit" onclick="vendorRegister()">
                        </div>
                    </div>
                </div>
            </div>
            <!-- </form> -->
            <button class="back-to-top">^</button>
        </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>