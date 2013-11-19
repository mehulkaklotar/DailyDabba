<%@page import="com.dailydibba.bean.Vendor"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.dailydibba.bean.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dailydibba.bean.Area"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Daily Dibba</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="HTML Theme">
        <meta name="author" content="Marcin Banaszek">



        <!-- Yahoo autocomplete widget -->
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/fonts/fonts-min.css" />
        <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.9.0/build/autocomplete/assets/skins/sam/autocomplete.css" />
        <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
        <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/animation/animation-min.js"></script>
        <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/datasource/datasource-min.js"></script>
        <script type="text/javascript" src="http://yui.yahooapis.com/2.9.0/build/autocomplete/autocomplete-min.js"></script>

        <jsp:include page="include.jsp"></jsp:include>

            <script src="js/commonTask.js"></script>
            <script language="javascript" type="text/javascript">
                jQuery(function($) {
                    var input = $('#myInput');
                    input.on('keydown', function() {
                        var key = event.keyCode || event.charCode;

                        if (key == 8 || key == 46)
                            return false;
                    });
                });
            </script> 

            <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
            <!--<script type="text/javascript">
                var geocoder;

                if (navigator.geolocation) {

                    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);

                }
                //Get the latitude and the longitude;
                function successFunction(position) {
                    var lat = position.coords.latitude;
                    var lng = position.coords.longitude;
                    codeLatLng(lat, lng)
                }

                function errorFunction() {
                    alert("Geocoder failed");
                }

                function initialize() {
                    geocoder = new google.maps.Geocoder();
                }

                function codeLatLng(lat, lng) {

                    var latlng = new google.maps.LatLng(lat, lng);
                    geocoder.geocode({'latLng': latlng}, function(results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            console.log(results)
                            if (results[1]) {
                                //formatted address
                                //alert(results[0].formatted_address)
                                //find country name
                                for (var i = 0; i < results[0].address_components.length; i++) {
                                    for (var b = 0; b < results[0].address_components[i].types.length; b++) {

                                        //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate

                                        if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
                                            //this is the object you are looking for
                                            state = results[0].address_components[i];

                                            break;
                                        }
                                        if (results[0].address_components[i].types[b] == "locality") {
                                            //this is the object you are looking for
                                            city = results[0].address_components[i];

                                            break;
                                        }
                                        if (results[0].address_components[i].types[b] == "sublocality") {
                                            //this is the object you are looking for
                                            area = results[0].address_components[i];

                                            break;
                                        }



                                    }
                                }
                                //city data
                                document.getElementById("txtSearch").value = area.short_name + "," + city.short_name;

                            } else {
                                alert("No results found");
                            }
                        } else {
                            alert("Geocoder failed due to: " + status);
                        }
                    });
                }
            </script>-->

        </head>

        <body class="home yui-skin-sam">
            <header>
                <div class="nav-bar">
                    <div class="nav-inside"> </div>
                </div>
                <div class="wrapper">

                    <!-- ******** LOGO START ******** -->
                    <div class="logo">
                        <h2>Daily Dabba</h2>
                        <!--<img src="images/daily-dibba.png" width="150" height="120"/>-->
                        <p>Eat Healthy, Live Healthy</p>
                        <a href="index.jsp"></a> 
                    </div>
                    <!-- ******** LOGO END ******** -->
                <%
                    List<Area> areaList = (List<Area>) request.getAttribute("areas");
                    String str = "";
                    Iterator it = areaList.iterator();
                    while (it.hasNext()) {
                        Area objArea = (Area) it.next();
                        str += "'" + objArea.getAreaName() + "',";
                    }
                    
                    List<City> cityList = (List<City>) request.getAttribute("cities");
                    it = cityList.iterator();
                    while (it.hasNext()) {
                        City objCity = (City) it.next();
                        str += "'" + objCity.getCityName() + "',";
                    }
                    
                    List<Vendor> vendorList = (List<Vendor>) request.getAttribute("vendors");
                    it = vendorList.iterator();
                    while (it.hasNext()) {
                        Vendor objVendor = (Vendor) it.next();
                        str += "'" + objVendor.getVendorName() + "',";
                    }

                %>
                <div class="searchBox">
                    <div class="span3">
                        <div>
                            <div style="float: left;width: 220px;">
                                <input type="text" id="txtSearch" style="margin-top: 10px;" placeholder="To Search type here" name="txtSearch"/>
                                <div id="myContainer"></div>
                                <script type="text/javascript">
                                    YAHOO.example.Data = {
                                        arrayStates: [
                                    <%= str%>
                                        ]
                                    };
                                    YAHOO.example.BasicLocal = function() {
                                        // Use a LocalDataSource
                                        var oDS = new YAHOO.util.LocalDataSource(YAHOO.example.Data.arrayStates);
                                        // Optional to define fields for single-dimensional array
                                        oDS.responseSchema = {fields: ["state"]};
                                        // Instantiate the AutoComplete
                                        var oAC = new YAHOO.widget.AutoComplete("txtSearch", "myContainer", oDS);
                                        oAC.prehighlightClassName = "yui-ac-prehighlight";
                                        oAC.useShadow = true;
                                        return {
                                            oDS: oDS,
                                            oAC: oAC
                                        };
                                    }();


                                </script>
                            </div>
                            <div align="center" style="float: right; margin-top: 10px;">
                                <input type="button" class="btnSearch" name="go" value="GO" onclick="showVendor()"/>
                            </div>
                        </div>
                        <div class="vendorlist" style="float: left" id="vendorList">
                            <!-- AJAX call to getVendor.js and geVendorList.jsp -->
                            <center>
                                <div style="color: #2fbbb2;">
                                    <img src="images/uparrow.png" height="100" width="100" style="border: none;"/><br>
                                    <b><font style="font-size: xx-large">Search</font></b><br>
                                    <b><font style="font-size: xx-large;">here</font></b><br><br><br>
                                    <b><font style="font-size: x-large;">Hungry</font></b><br>
                                    <b><font style="font-size: x-large;">kya?</font></b><br>
                                    <b><font style="font-size: x-large;">Want</font></b><br>
                                    <b><font style="font-size: x-large;">tiffin?</font></b>
                                </div>
                            </center>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
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
                    <div class="slide"> <img src="images/tiffin.PNG" />
                        <div class="slide_content">
                            <div class="slide_content_wrap">
                                <h4 class="title">Know Your Daily Tiffin</h4>
                                <p class="description">with too many options</p>
                            </div>
                        </div>
                    </div>
                    <div class="slider_container">
                        <div class="slide"> <img src="images/thali.JPG" />
                            <div class="slide_content">
                                <div class="slide_content_wrap">
                                    <h4 class="title">Know Your Daily Tiffin</h4>
                                    <p class="description">with too many options</p>
                                </div>
                            </div>
                        </div>
                        <div class="slide"> <img src="images/thali1.jpg" />
                            <div class="slide_content">
                                <div class="slide_content_wrap">
                                    <h4 class="title">order from home</h4>
                                    <p class="description">cash on delievry</p>
                                </div>
                            </div>
                        </div>
                        <div class="slide"> <img src="images/thali2.jpg" />
                            <div class="slide_content">
                                <div class="slide_content_wrap">
                                    <h4 class="title">Enjoy new food daily</h4>
                                    <p class="description">stay connected</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="timers"></div>
                    <div class="slidePrev"><span></span></div>
                    <div class="slideNext"><span></span></div>
                </div>
                <!-- ******** FULL WIDTH SLIDER END ******** -->

        </header>

        <!-- ******** REVIEWS START ******** -->
        <section class="reviews">
            <div class="wrapper">
                <div class="carousel" data-transition="slide">
                    <div>
                        <blockquote>Great seasonal and regional TIFFINS with a creative twist. Direct to your doorstep.</blockquote>
                        <p>- SWE Team 4, DA-IICT</p>
                    </div>
                    <div>
                        <blockquote>Nice and quite, ideal for people who miss home food. Menus always have fantastic value.</blockquote>
                        <p>- SWE Team 4, DA-IICT</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- ******** REVIEWS END ******** -->

        <article class="wrapper">

            <!-- ******** HIGHLIGHT START ******** -->
            <div class="row">
                <div class="span3">
                    <div class="padding center">
                        <p><img src="images/icon-food.png" alt="Excellent Food" /></p>
                        <h3>Edible Gift</h3>
                        <p>Homemade gourmet presents for everyone. Get yourself a feeling of having home cooked every day. Tasty and hearty food in appropriate portions.</p>
                    </div>
                </div>
                <hr class="line">
                <div class="span3">
                    <div class="padding center">
                        <p><img src="images/icon-wine.png" alt="Fantastic Wine" /></p>
                        <h3>Healthy </h3>
                        <p>Lighter choices for a guilt free mealtime. A well planned meal having a good mix of nutrition and taste. Your body is a Temple. You are what you eat.</p>
                    </div>
                </div>
                <hr class="line">
                <div class="span3">
                    <div class="padding center">
                        <p><img src="images/icon-staff.png" alt="Friendly Staff" /></p>
                        <h3>Quick & Easy</h3>
                        <p>Don't let your busy routine get in the way of your food,delicious food at your door step in just a few clicks as a fit and healthy body is the best fashion statement.</p>
                    </div>
                </div>
                <hr class="line">
                <div class="span3">
                    <div class="padding center">
                        <p><img src="images/icon-location.png" alt="Great Location" /></p>
                        <h3>Variety of Menus</h3>
                        <p>Bored of eating the same kind of food everyday!! Choose from range of dishes and also customize your menu.</p>
                    </div>
                </div>
            </div>
            <!-- ******** HIGHLIGHT END ******** -->

            <!--<div class="row">
              <div class="span12">
                <hr>
              </div>
            </div>-->

            <!--******** BLOG START ********
                         <div class="row blog">
        
                                 <div class="span4">
                                         <div class="padding center">
                                                 <p><img src="images/photo-dessert.png" alt="Dessert" class="round" /></p>
                                                 <h3>Best Dessert in The World</h3>
                                                 <h6>29 / 03 / 2012 - 4 Comments</h6>
                                                 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vitae mauris erat. Nulla facilisi. Vivamus consectetur rutrum massa eu euismod sed eget.</p>
                                                 <p><a href="#" class="button">Read More</a></p>
                                         </div>
                                 </div>
                                
                                 <hr class="line">
        
                                 <div class="span4">
                                         <div class="padding center">
                                                 <p><img src="images/photo-steak.png" alt="Steak" class="round" /></p>
                                                 <h3>Juicy Grilled Steaks</h3>
                                                 <h6>22 / 03 / 2012 - 7 Comments</h6>
                                                 <p>Fusce a feugiat elit. Nunc sit amet velit purus, sit amet vestibulum nibh. Donec enim orci, sagittis at blandit nec, sollicitudin id metus. Ut urna risus, pharetra at sagittis.</p>
                                                 <p><a href="#" class="button">Read More</a></p>
                                         </div>
                                 </div>
        
                                 <hr class="line">
        
                                 <div class="span4">
                                         <div class="padding center">
                                                 <p><img src="images/photo-tomatoes.png" alt="Tomatoes" class="round" /></p>
                                                 <h3>Seasonal Food</h3>
                                                 <h6>18 / 03 / 2012 - 25 Comments</h6>
                                                 <p>Aliquam erat volutpat. Vestibulum egestas suscipit libero, a rutrum sem euismod et. Nulla facilisi. Duis bibendum ullamcorper purus eget lobortis.</p>
                                                 <p><a href="#" class="button">Read More</a></p>
                                         </div>
                                 </div>
        
                         </div>
            <!-- ******** BLOG END ******** -->

        </article>

        <jsp:include page="footer.jsp"></jsp:include>

        <button class="back-to-top">^</button>
    </body>
</html>