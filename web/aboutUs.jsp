<%-- 
    Document   : search
    Created on : 8 Oct, 2013, 2:16:44 AM
    Author     : kaklo
--%>

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
                        <a href="Controller?action=getIndex"></a> </div>
                    <!-- ******** LOGO END ******** -->

                    <!-- ******** NAVIGATION START ******** -->

                <jsp:include page="nav.jsp"></jsp:include>

                    <button class="nav-trigger">Navigation</button>

                    <!-- ******** NAVIGATION END ******** --> 

                    <div id ="labelWelcome" class="labelWelcome">
                        <span>Welcome, 
                        <% if (session.getAttribute("UserName") != null) {
                                out.print(session.getAttribute("UserName"));
                        %> <a href="Controller?action=logout" >Logout</a> 
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

            <!-- ******** CONTENT START ******** -->
            <div class="row">
                <div class="span12">
                    <h1 class="center">About Us</h1>
                    <blockquote>There is no sincerer love than the love for food. </blockquote>
                    <p class="center">~George Bernard Shaw </p>
                </div>
            </div>

            <div class="row">
                <div class="span6">
                    <div class="padding">
                        <p>“Daily Dabba”, has originated from simple idea to let people working in offices, students away from home choose and pick their lunch and dinner daily with ample choice of menus and cooks. We also aim to provide tiffin service providers a way to earn and showcase their cooking talent.</p>
                    </div>
                </div>
                <div class="span6">
                    <div class="padding">
                        <p>Since we ourselves are host elites, hence we can relate to the problem faced by people like us in terms of food. Our target customers are people who need healthy home cooked food to be delivered at their doorstep. We wish to keep them away from unhealthy fast food.
                            We believe that every individual has different taste so we strive to ensure that our customers have plethora of options from where they can select their tiffin.
                            So find out what the tiffin service providers have to offer you & enjoy.
                        </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <hr>
            </div>
            <!-- ******** CONTENT END ******** -->


        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

