<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

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
            <style type="text/css">
                .Cart{
                    width: 555px;
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

                #ordersummery{
                    text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
                    background-color: #fcf8e3;
                    border: 1px solid #fbeed5;
                    -webkit-border-radius: 4px;
                    -moz-border-radius: 4px;
                    border-radius: 4px;
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
                    <li><a href="Controller?action=getVendor&vendorUN=${vendor.getUserName()}">Vendor</a> <span class="divider">/</span></li>
                    <li class="active">Cart</li>
                    <li class="active">Order Summery</li>
                </ul>
                <div id="order" style="height: 500px;width:50%;">
                    <div style="background-color: powderblue">
                        <div style="float: left; padding-left: 10px; padding-top: 10px">
                            <i class="icon-envelope"></i>
                        </div>
                        <div>
                            <h3 style="text-align: center;">Order Summery</h3>
                        </div>
                    </div>
                    <div id="ordersummery" class="Cart">

                        <label class="label" style="margin-top: 10px;">Order ID:</label><span>&nbsp;${tiffin.getOrderID()}</span> <br/>
                        <label class="label" style="margin-top: 10px;">Vendor:</label><span>&nbsp;${vendor.vendorName} (${vendor.mobileNo})</span> <br/>
                        <label class="label" style="margin-top: 10px;">No Of Tiffins:</label><span>&nbsp;${tiffin.getNumberOfTiffin()}</span> <br/>
                        <label class="label" style="margin-top: 10px;">Total Cost:</label><span>&nbsp;Rs. ${tiffinCost* tiffin.getNumberOfTiffin()}</span> <br/>
                        <label class="alert-success text-center" style="margin-top: 10px;">Your tiffin will be delivered between 12 p.m. to 2 p.m.  </label>
                    </div>
                    <div style="margin:10px 0 0 0;">
                        <a href="Controller?action=getVendor&vendorUN=${vendor.getUserName()}" class="button"> < Order more?</a>
                    </div>
                </div>

            </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

