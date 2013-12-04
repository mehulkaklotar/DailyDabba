<%-- 
    Document   : updateProfileCustomer
    Created on : Oct 25, 2013, 12:24:24 PM
    Author     : hp
--%>

<%@page import="com.dailydibba.bean.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">

        <jsp:include page="include.jsp"></jsp:include>
            <script>
                
                var b = new Boolean(true);
                $(document).ready(function() {    
                    $('#ddlCity').change(function() {
                        $.ajax({
                            url: "Controller?action=getAllAreaByCity&cityID=" + $('#ddlCity').val()
                        }).done(function(result) {
                            $('#ddlArea').html(result);
                        });
                    });

                    $('#ddlCity').val($('#ddlCity').data('city'));
                    $('#ddlArea').val($('#ddlArea').data('area'));

                });
                

                function checkemail() {
                    if ($('#txtEmailID').val() != "") {
                        var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
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
                  function checkfirstname() {
                    if ($('#txtFirstname').val() != "") {
                            $('#alertFirstName').html("Required");
                            b = true;
                            return true;
                        
                        }
                        else {
                                $('#alertFirstName').html("*");
                            b = false;
                        
                        }
                    }
                
                  function checklastname() {
                    if ($('#txtLastname').val() != "") {
                            $('#alertLastName').html("Required");
                            b = true;
                            return true;
                        
                        }
                        else {
                                $('#alertLastName').html("*");
                            b = false;
                        
                        }
                    }
                
                  function checkaddress() {
                    if ($('#txtAddress').val() != "") {
                          
                              $('#alertAddress').html("*");
                            b = true;
                            return true;
                        
                        }
                        else {
                            $('#alertAddress').html("* Required");
                            b = false;
                            }
                    }
                
                 function checkarea() {
                    if ($('#ddlArea').val() != "") {
                        
                        
                            $('#alertArea').html("Required");
                            b = true;
                            return true;
                         }
                        else {
                                $('#alertArea').html("*");
                            b = false;
                       
                        }
                    }
                
                function checkmobile() {
                    if ($('#txtMobileNumber').val() != "") {
                        var pattern = /^[789]\d{9}$/;
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
                function updateprofile()
                {
                    if(b)
                        {
                              $.post("Controller?action=updateProfile", {
                                    username: $('#txtUsername').val(),                                 
                                    firstname: $('#txtFirstname').val(),
                                    lastname: $('#txtLastname').val(),
                                    mobileno: $('#txtMobileNumber').val(),
                                    emailid: $('#txtEmailID').val(),                                   
                                    area: $('#ddlArea').val(),
                                    address: $('#txtAddress').val()
                                },
                                function(response) {
                                    if ($.trim(response) == 'success') {
                                        setTimeout("verification()", 2000);
                                    } else {
                                        alertMessage("error", "Invalid Usename and password!!!");
                                    }
                                });
                        }else
                            {
                                  $('#alertupdatecustomer').html("Enter your details properly");
                            }
                }
      
            </script>
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
                        <a href="Controller?action=getIndex"></a> </div>
                    <!-- ******** LOGO END ******** -->

                    <!-- ******** NAVIGATION START ******** -->

                <jsp:include page="nav.jsp"></jsp:include>

                    <button class="nav-trigger">Navigation</button>

                    <!-- ******** NAVIGATION END ******** --> 

                    <div class="labelWelcome">
                        <span>Welcome, 
                        <% if (session.getAttribute("UserName") != null) {
                                out.print(session.getAttribute("UserName"));
                        %> <a href='Controller?action=logout'>Logout</a> 
                        <%
                        } else {
                        %> Guest
                        <% }
                        %>
                    </span>
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
                <li class="active">Update Profile</li>
            </ul>
            <form name="updateProfileCustomer" method="post" onsubmit="updateprofile();" id="updateProfileCustomer">
                
                                  <div align="center" class="row">
                    <%
                        Customer cust = (Customer) request.getAttribute("Customer");
                    %>
                    <table>
                        <tbody>
                            <tr align="left">
                                <td>Username:</td>
                                <td>
                                    <div>
                                        <input type="text" readonly="readonly" style="width:auto;" name="txtUsername" id="txtUsername" required="" value="<%=cust.getUserName()%>">
                                        <!-- <span class="required">*</span>
                                         <span class="required">Should be unique</span> -->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>First Name:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="First Name" onkeyup="checkfirstname();" name="txtFirstname" id="txtFirstname" required value="<%=cust.getFirstName()%>" />
                                     <span id="alertFirstName" name="alertFirstName" class="alert">* Required</span>
                                    </div>
                                </td>                             
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Last Name" onkeyup="checklastname();" name="txtLastname" required id="txtLastname" value="<%=cust.getLastName()%>">
                                   <span id="alertLastName" name="alertLastName" class="alert">* Required</span>
                                    
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile Number:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Mobile Number" onkeyup="checkmobile();" required  name="txtMobileNumber" id="txtMobileNumber" value="<%=cust.getMobileNo()%>">
                                          <span id="alertMobile" class="alert">Valid mobile no only</span>
                                    <span style="margin-left: 25px;" class="alert-info">Enter 10 digits only i.e.9090909090 </span>
                               
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Email ID:</td>
                                <td>
                                    <div>
                                        <input type="email" required style="width:auto;" onkeyup="checkemail();" placeholder="Email ID" name="txtEmailID" id="txtEmailID" value="<%=cust.getEmailID()%>"> 
                                         <span id="alertEmail" class="alert">Valid Email Address only</span>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>City:</td>
                                <td>
                                    <select id="ddlCity" name="ddlCity" data-city="<%=cust.getArea().getCity().getCityID()%>" class ="selectStyle">
                                        <c:forEach items="${Cities}" var="city">

                                            <option value="${city.cityID}">${city.cityName}</option>

                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Area</td>
                                <td>
                                    <div name="areaDiv" id="areaDiv">
                                        <select id="ddlArea" data-area="<%=cust.getArea().getAreaID()%>"  required="" name="ddlArea" class ="selectStyle">
                                            <c:forEach items="${Areas}" var="area">

                                                <option value="${area.areaID}">${area.areaName}</option>

                                            </c:forEach>
                                        </select>
                                              <span id="alertArea" class="alert">* Required</span>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td>
                                    <div>
                                        <textarea placeholder="Address" required style="width:300px;"  onkeyup="checkaddress();" name="txtAddress" id="txtAddress" >
                                        <%=cust.getLane()%></textarea>  
                                          <span id="alertAddress" name="alertAddress" class="alert">* Required</span>
                                    </div>
                                </td>
                            </tr>

                            </div>    
                        </tbody>
                    </table>

                    <div class="row" >
                        <div class="span6">

                            <input type="submit"  value="Update" >
                        </div>
                    </div>
            </form>
            <button class="back-to-top">^</button>
        </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>
