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
            <script src="js/commonTask.js"></script>
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


                <div class="row">
                    <div class="span12">
                        <hr>
                        <h2>Update Profile</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>

                <form name="updateProfileCustomer" method="post" action="Controller?action=updateProfile" id="updateProfileCustomer">
                    <div align="center" class="row">
                    <%
                        Customer cust = (Customer) request.getAttribute("Customer");
                    %>
                    <table align="center" width="500px">
                        <tbody>
                            <tr align="left">
                                <th>Username:</th>
                                <td>
                                    <div>
                                        <input type="text" readonly="readonly" style="width:auto;" name="txtUsername" required="" value="<%=cust.getUserName()%>">
                                        <!-- <span class="required">*</span>
                                         <span class="required">Should be unique</span> -->
                                    </div>
                                </td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <th>First Name:</th>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="First Name" name="txtFirstname" id="txtFirstname" value="<%=cust.getFirstName()%>" 
                                    </div>
                                <td>   
                            </tr>
                            <tr>
                                <th>Last Name:</th>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Last Name" name="txtLastname" id="txtLastname" value="<%=cust.getLastName()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>Mobile Number:</th>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="Mobile Number"   name="txtMobileNumber" value="<%=cust.getMobileNo()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>Email ID:</th>
                                <td>
                                    <div>
                                        <input type="email" style="width:auto;" placeholder="Email ID" name="txtEmailID" value="<%=cust.getEmailID()%>"> 
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>City:</th>
                                <td>
                                    <select id="ddlCity" name="ddlCity" class ="selectStyle">
                                        <c:forEach items="${Cities}" var="city">
                                          
                                                    <option value="${city.cityID}" ${city.cityID == cust.area.city.cityID? 'selected' : ''}>${city.cityName}</option>
                                            
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Area</th>
                                <td>
                                    <div name="areaDiv" id="areaDiv">
                                        <select id="ddlArea" name="ddlArea" class ="selectStyle">
                                        <c:forEach items="${Areas}" var="area">
                                          
                                                    <option value="${area.areaID}" ${areaID == cust.area.areaID? 'selected' : ''}>${area.areaName}</option>
                                            
                                        </c:forEach>
                                    </select>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <th>Address:</th>
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
