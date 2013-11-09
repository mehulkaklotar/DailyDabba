<%-- 
    Document   : updateProfileVendor
    Created on : Oct 25, 2013, 12:57:33 PM
    Author     : hp
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dailydibba.bean.Vendor"%>
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
                        <h2>Vendor Registration</h2>
                        <div class="message">
                            <div id="alert"></div>
                        </div>
                    </div>
                </div>
               
                <form name="updateProfileVendorForm" method="post" action="Controller?action=updateProfileVendor" id="updateProfileVendor">
                    <div align="center" class="row">
                         <%
                               
                           Vendor vend=(Vendor)request.getAttribute("Vendor");
                       
                         %>
                        <table>
                            <tbody>
                            <tr>
                                <th>Username:</th>
                                <td>
                                    <div>
                                        <input readonly="readonly" type="text" id="txtUsername" name="txtUsername" value="<%=vend.getUserName()%>">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    Vendor Name:
                                </th>
                                <td>
                                    <div>
                                        <input type="text" style="width:auto;" placeholder="First Name" name="txtVendorname" value="<%=vend.getVendorName()%>" >
                                    </div>
                                </td>
                            </tr>
                        <tr>
                            <th>Owner Name:</th>
                            <td>
                                <div>
                                    <input type="text" style="width:auto;" placeholder="Last Name" name="txtOwnername" value="<%=vend.getOwnerName()%>">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>Mobile Number:</th>
                            <td>
                                <div>
                                    <input type="text" style="width:auto;" placeholder="Mobile Number" name="txtMobileNumber" value="<%=vend.getMobileNo()%>">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>Email ID:</th>
                            <td>
                                <div>
                                    <input type="text" style="width:auto;" placeholder="Email ID" name="txtEmailID" value="<%=vend.getEmailID()%>">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>City and Area:</th>
                            <td>
                                <div>
                                    <select name="ddlCity" id="ddlCity" class="selectStyle">
                                        <c:forEach items="${Cities}" var="city">
                                            <option value="${city.cityID}" ${city.cityID == vend.area.city.cityID? 'selected' : ''}>${city.cityName}</option>
                                        </c:forEach>
                                    </select>
                                                   
                                  <div name="areaDiv" id="areaDiv">
                                        <select id="ddlArea" name="ddlArea" class ="selectStyle">
                                        <c:forEach items="${Areas}" var="area">
                                            <option value="${area.areaID}" ${areaID == vend.area.areaID? 'selected' : ''}>${area.areaName}</option>
                                        </c:forEach>
                                    </select>
                                    </div>
                               </div>
                            </td>
                        </tr>
                        <tr>
                            <th>Address:</th>
                            <td>    
                                <div>
                                    <textarea style="width:300px;" placeholder="Address" id="txtAdressVendor" name="txtAddressVendor"><%=vend.getLane()%></textarea>           
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <th>Landline Number:</th>
                            <td>
                                <div>
                                    <input type="text" style="width:auto;" placeholder="Email ID" name="txtLandlineNumber" value="<%=vend.getLandlineNumber()%>">
                                </div>
                            </td>
                        </tr>                          

                    </div>
                    <div class="row">
                        <div class="span6">
                            <td colspan="2">
                                <input type="submit" value="Update">
                            </td>
                        </div>
                    </tbody>
                    </table>
                    </div>
                </form>
                <button class="back-to-top">^</button>
            </article>


        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

