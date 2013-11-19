<script type = "text/javascript" >

   function preventBack(){window.history.forward();}

    setTimeout("preventBack()", 0);

    window.onunload=function(){null};

</script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("UserName") == null) {
%>
<jsp:forward page="login.jsp?from=${pageContext.request.requestURI}"></jsp:forward>
<%            }
%>
<!doctype html>

<script src="js/../bootstrap/js/bootstrap.js"></script>
<script src="js/../bootstrap/js/bootstrap.min.js"></script>
<script src="js/../bootstrap/js/jqBootstrapValidation.js"></script>
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap-responsive.min.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="js/../bootstrap/css/bootstrap.min.css"/>

<html>
    <head>
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.css" />
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- or use local jquery -->
        <script src="/js/jqBootstrapValidation.js"></script>
        <jsp:include page="include.jsp"></jsp:include>
            <script src="js/addFeedback.js"></script>

            <script>

                var b = new Boolean(true);


                function checkrating() {
                    var r = $('#rating').val();
                    if ($('#rating').val() != "") {
                        var pattern = /^-?\d*\.?\d*$/;
                        if (!pattern.test($('#rating').val())) {
                            $('#alertrating').html("Insert number only");
                            b = false;
                        }
                        else {
                            if (r < 0) {
                                $('#alertrating').html("Cannot be less than zero!!");
                                b = false;
                                return;
                            }
                            else if (r > 10)
                            {
                                $('#alertrating').html("Cannot be more than tan!!");
                                b = false;
                                return;
                            }
                            else {
                                $('#alertrating').html("ThankYou!!");
                                b = true;
                                return true;
                            }
                        }
                    }

                }

                function feedback() {
                    if (!b) {
                        $('#alertFeedback').html("Please provide correct details !!!");
                    }
                    else
                    {
                        var m = $('#message').val();

                        if ($('#message').val() === "")
                        {
                            $('#alertmessage').html("Please enter your feedback!!");
                            b = false;
                            return;
                        }
                        else
                        {
                            addFeedback('${param['userName']}');
                        }
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
            <div style="margin: auto">
                <h2 class="center">Feedback</h2>
                <div class="message">
                    <div id="alert"></div>
                </div>
            </div>
            <hr></hr>
            <article class="wrapper"> 

                <div class="Feedback">
                    <div style="margin-left: 20px;">
                        <div style="padding-top: 20px;padding-bottom: 10px;">
                            <span id="alertFeedback" class="alert-danger"></span>
                        </div>
                        <div align="left" class="row">
                            <div>
                                <label> Vendor Name : &nbsp;<font class="badge badge-success" style="font-size: x-large; padding:10px;min-width: 50px;text-align: center"> ${param['userName']} </font> </label> 
                            </div>
                            <br>
                            <div>
                                <textarea style="width: 300px;" id="message" placeholder="Your Feedback" required name="message"></textarea>
                                <span class="required">*</span>
                                <span id="alertmessage" class="alert">Mandatory</span>
                            </div>
                            <div>
                                <label> Give your rating : </label> 
                            </div>
                            <div style="margin-top: 10px">
                                <input type="text" required name="rating" onchange="return checkrating();" id="rating" required placeholder="rating"  style="width: 20%; height: 5%"></input> 
                                <span class="required">*</span>
                                <span id="alertrating" class="alert">Rate Them!!</span>
                            </div>
                            <div>
                                <button class="btn btn-primary" type="submit" onclick="return feedback();">Submit your Feedback</button>
                            </div>

                        </div>
                    </div>
            </article>

        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>

