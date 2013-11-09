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
                        <blockquote>Passion is people. People who love what they do and take your enjoyment personally. Passion is what to expect from the people who take your order and the people who craft your meal.</blockquote>
                        <p class="center">- John &amp; Jane Smith, The Owners</p>
                    </div>
                </div>

                <div class="row">
                    <div class="span6">
                        <div class="padding">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin iaculis egestas ligula, non commodo nulla porta quis. Nullam quis nulla augue, rutrum facilisis erat. Sed dictum rutrum felis, at ullamcorper purus malesuada ac. Curabitur eu augue vel urna molestie porttitor nec et augue. Maecenas porttitor tincidunt tortor id sagittis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce auctor elementum sem at ullamcorper. Aenean a dui quis metus ultrices blandit non eget metus. Integer ultrices iaculis luctus. Aliquam tempus enim id metus commodo porttitor non ac tortor.</p>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="padding">
                            <p>Curabitur consectetur odio eget neque venenatis sagittis. Donec quis enim velit, non tincidunt tortor. Morbi ac elit lorem, ut ornare diam. Sed quam magna, euismod ut tempor quis, suscipit at tellus. Vivamus scelerisque metus non elit convallis rutrum. Vivamus eget purus orci, non imperdiet ipsum. Morbi faucibus fermentum libero, sit amet dapibus risus pretium in. Phasellus a elit id ligula elementum luctus a at felis. Fusce varius ultricies interdum. In urna sem, tincidunt vitae vehicula interdum, ultricies a nibh. Ut ac risus vitae nunc eleifend varius. Ut pretium, neque in sodales viverra, nisl nisi tincidunt diam, nec tempor eros mauris.</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <hr>
                </div>
                <!-- ******** CONTENT END ******** -->

                <!-- ******** STAFF START ******** -->
                <div class="row blog">

                    <div class="span12">
                        <h2 class="center">Our Friendly Staff</h2>
                    </div>

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff1.jpg" alt="Staff" class="round" /></p>
                            <h3>John &amp; Jane Smith</h3>
                            <h6>Owners</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mauris erat. Nulla facilisi. Vivamus consectetur rutrum massa eu euismod. Sed eget cursus tellus.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                    <hr class="line">

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff2.jpg" alt="Staff" class="round" /></p>
                            <h3>Margareth Williams</h3>
                            <h6>Restaurant Manager</h6>
                            <p>Fusce a feugiat elit. Nunc sit amet velit purus, sit amet vestibulum nibh. Donec enim orci, sagittis at blandit nec, sollicitudin id metus. Ut urna risus, pharetra at sagittis eget.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                    <hr class="line">

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff3.jpg" alt="Staff" class="round" /></p>
                            <h3>Mark Johnson</h3>
                            <h6>Chef</h6>
                            <p>Aliquam erat volutpat. Vestibulum egestas suscipit libero, a rutrum sem euismod et. Nulla facilisi. Duis bibendum ullamcorper purus eget lobortis. Aliquam laoreet tincidunt.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                    <hr class="line">

                </div>
                <div class="row blog">

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff4.jpg" alt="Staff" class="round" /></p>
                            <h3>Adam Borris</h3>
                            <h6>Cook</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mauris erat. Nulla facilisi. Vivamus consectetur rutrum massa eu euismod. Sed eget cursus tellus.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                    <hr class="line">

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff5.jpg" alt="Staff" class="round" /></p>
                            <h3>Julie Montgomery</h3>
                            <h6>Floor Manager</h6>
                            <p>Fusce a feugiat elit. Nunc sit amet velit purus, sit amet vestibulum nibh. Donec enim orci, sagittis at blandit nec, sollicitudin id metus. Ut urna risus, pharetra at sagittis eget.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                    <hr class="line">

                    <div class="span4">
                        <div class="padding center">
                            <p><img src="images/photo-staff6.jpg" alt="Staff" class="round" /></p>
                            <h3>Martha Cox</h3>
                            <h6>Waitress</h6>
                            <p>Aliquam erat volutpat. Vestibulum egestas suscipit libero, a rutrum sem euismod et. Nulla facilisi. Duis bibendum ullamcorper purus eget lobortis. Aliquam laoreet tincidunt.</p>
                            <p>
                                <a href="http://facebook.com/" target="_blank"><img src="images/icon-green-facebook.png" alt="Facebook" /></a>
                                <a href="http://twitter.com/" target="_blank"><img src="images/icon-green-twitter.png" alt="Twitter" /></a>
                                <a href="http://linkedin.com/" target="_blank"><img src="images/icon-green-linkedin.png" alt="LinkedIn" /></a>
                            </p>
                        </div>
                    </div>

                </div>
                <!-- ******** STAFF END ******** -->
            </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

