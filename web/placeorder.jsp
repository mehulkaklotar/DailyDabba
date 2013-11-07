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
                    <li><a href="Controller?action=getVendor">Vendor</a> <span class="divider">/</span></li>
                    <li class="active">Order Cart</li>
                </ul>
                <div style="height:500px;">
                    <div id="AddressInfo" class="Cart" style="float: left;">
                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-road"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center;">Delivery Address</h3>
                            </div>
                        </div>
                        <div  class="row" style="padding-left: 30px;width:45%;">
                            <div>
                                <select id="ddlArea">
                                    <option id="0" value="0">Select Area</option>
                                </select>
                            </div>
                            <div style="margin-top: 10px;">
                                <select id="ddlCity">
                                    <option id="0" value="0">Select City</option>
                                </select>
                            </div>
                            <div style="margin-top: 10px;">
                                <textarea  placeholder="Address" id="deliveryaddress" name="deliveryaddress"></textarea>
                            </div>
                        </div>

                    </div>
                    <div id="cart" class="Cart" style="float: right;">
                        <div style="background-color: powderblue">
                            <div style="float: left; padding-left: 10px; padding-top: 10px">
                                <i class="icon-shopping-cart"></i>
                            </div>
                            <div>
                                <h3 style="text-align: center;">Cart</h3>
                            </div>
                        </div>
                        <table class="table table-bordered">
                            <tr style="background-color: #e5e5e5;">
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
                            <tr style="font-size: smaller;">
                                <td>jsdhfh</td>
                                <td>jsdhjh</td>
                                <td>jdsfjh</td>
                                <td>jsdfh</td>
                                <td>jdsfhj</td>
                            </tr>
                            <tr style="color: #e5e5e5;">
                                <td colspan="5">
                                    <div><label class="alert">Items per tiffin : </label></div>
                                    <div><label class="label-success span1" style="padding-top: 3px;">&nbsp;&nbsp;&nbsp; Sabzi:</label> <span class="text-success"> #5 <i class="badge">Rs.4</i></span></div>
                                    <div><label class="label-info span1" style="padding-top: 3px;">&nbsp;&nbsp;&nbsp; Roti:</label> <span class="text-success"> #5 <i class="badge">Rs.4</i></span></div>
                                    <div><label class="label-inverse span1" style="padding-top: 3px;">&nbsp;&nbsp;&nbsp; Rice:</label> <span class="text-success"> #5 <i class="badge">Rs.4</i></span></div>
                                    <div><label class="label-warning span1" style="padding-top: 3px;">&nbsp;&nbsp;&nbsp; Dal:</label> <span class="text-success"> #5 <i class="badge">Rs.4</i></span></div>
                                    <div><label class="label-important span1" style="padding-top: 3px;">&nbsp;&nbsp;&nbsp; Others:</label> <span class="text-success"> #5 <i class="badge">Rs.4</i></span></div>
                                </td>
                            </tr>
                        </table>
                        <div class="row" style="padding-left:30px; ">
                            <div style="width: 45%;">
                                <a href="#" class="button"  style="float: left;">Back</a>
                                <a href="orderconfirm.jsp#order" class="button" style="float: right;">Confirm Order</a>
                            </div>
                        </div>
                    </div>
                    <div style="clear: both;"></div>

                </div>

            </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

