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
                <div style="background-color: powderblue">
                    <div style="float: left; padding-left: 10px; padding-top: 10px">
                        <i class="icon-shopping-cart"></i>
                    </div>
                    <div>
                        <h3 style="text-align: center">Your Tiffine Cart </h3>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr style="width: 10%">
                            <td>
                                Order ID
                            </td>
                            <td>
                                Vendor
                            </td>
                            <td>
                                # of Tiffin
                            </td>
                            <td>
                                Cost per Tiffin (Rs.)
                            </td>
                            <td>
                                Total Cost (Rs.)
                            </td>
                        </tr>
                    </thead>
                    <tr>
                        <td>${tiffin.getOrderID()}</td>
                    <td>${vendorUN}</td>
                    <td>${tiffin.getNumberOfTiffin()}</td>
                    <td>Rs. ${tiffinCost}</td>
                    <td>Rs. ${tiffinCost* tiffin.getNumberOfTiffin()}</td>
                </tr>
            </table>
            <a href="Controller?action=cancelOrder&orderID=${tiffin.getOrderID()}&vendorUN=${vendorUN}">Cancel Order?</a>
            <a href="Controller?action=confimOrder&orderID=${tiffin.getOrderID()}">Confirm Order?</a>

            <div style="background-color: powderblue">
                    <div style="float: left; padding-left: 10px; padding-top: 10px">
                        <i class="icon-globe"></i>
                    </div>
                    <div>
                        <h3 style="text-align: center"> Delivery Information </h3>
                    </div>
            </div>
            
            
            
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

