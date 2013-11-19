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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- or use local jquery -->


        <jsp:include page="include.jsp"></jsp:include>
            <script>
                $(document).ready(function() {
                    var b = new Boolean(true);
                    $('#ddlCity').change(function() {
                        $.ajax({
                            url: "Controller?action=getAllAreaByCity&cityID=" + $('#ddlCity').val(),
                        }).done(function(result) {
                            $('#ddlArea').html(result);
                        });
                    });

                    $('#ddlCity').val($('#ddlCity').data('city'));
                    $('#ddlArea').val($('#ddlArea').data('area'));

                });

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
                        <a href="index.html"></a> </div>
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
                <lii class="active">Update Profile</li>
            </ul>
            <form name="updateProfileCustomer" method="post" action="Controller?action=updateProfile" id="updateProfileCustomer">
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
                                        <input type="text" readonly="readonly" style="width:auto;" name="txtUsername" required="" value="<%=cust.getUserName()%>">
                                        <!-- <span class="required">*</span>
                                         <span class="required">Should be unique</span> -->
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>First Name:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="First Name" name="txtFirstname" id="txtFirstname" value="<%=cust.getFirstName()%>" />
                                    </div>
                                </td>                             
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Last Name" name="txtLastname" id="txtLastname" value="<%=cust.getLastName()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Mobile Number:</td>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Mobile Number"   name="txtMobileNumber" value="<%=cust.getMobileNo()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Email ID:</td>
                                <td>
                                    <div>
                                        <input type="email" style="width:auto;" placeholder="Email ID" name="txtEmailID" value="<%=cust.getEmailID()%>"> 
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
                                        <select id="ddlArea" data-area="<%=cust.getArea().getAreaID()%>"  name="ddlArea" class ="selectStyle">
                                            <c:forEach items="${Areas}" var="area">

                                                <option value="${area.areaID}">${area.areaName}</option>

                                            </c:forEach>
                                        </select>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td>
                                    <div>
                                        <textarea placeholder="Address" style="width:300px;" name="txtAddress" ><%=cust.getLane()%>
                                        </textarea>              
                                    </div>
                                </td>
                            </tr>

                            </div>    
                        </tbody>
                    </table>

                    <div class="row" >
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
