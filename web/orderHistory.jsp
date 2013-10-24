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
            <div>
                <h2 class="center">Order History</h2>
                <div class="message">
                    <div id="alert"></div>
                </div>
            </div>
            <table class="table">
                <thead style="color: white; background-color: rgb(47, 187, 178)">
                    <tr style="text-align: center">
                        <td>
                            No
                        </td>
                        <td title="Click on vendor name to give Feedback">
                            Vendor Name
                        </td>
                        <td>
                            Date
                        </td>
                        <td>
                            Total Tiffins
                        </td>
                        <td>
                            Total Cost (Rs.)
                        </td>
                    </tr>
                </thead>
                <tr style="text-align: center">
                    <td>
                        1
                    </td>
                    <td>
                        <a  href="vendor.jsp">Sai Tiffin</a>
                    </td>
                    <td>
                        10-14-2013
                    </td>
                    <td>
                        4
                    </td>
                    <td>
                        200
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td>
                        2
                    </td>
                    <td>
                        Matarani Tiffin
                    </td>
                    <td>
                        10-14-2013
                    </td>
                    <td>
                        4
                    </td>
                    <td>
                        200
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td>
                        3
                    </td>
                    <td>
                        Sai Sagar Tiffin
                    </td>
                    <td>
                        10-14-2013
                    </td>
                    <td>
                        4
                    </td>
                    <td>
                        200
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td>
                        4
                    </td>
                    <td>
                        Jay Raj Tiffin
                    </td>
                    <td>
                        10-14-2013
                    </td>
                    <td>
                        4
                    </td>
                    <td>
                        200
                    </td>
                </tr>
            </table>
        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

