<%-- 
    Document   : orders
    Created on : 12 Oct, 2013, 1:41:39 AM
    Author     : kaklo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <title>Beoro Admin Template v1.2</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript">
            function controlVisibility(){
                document.getElementById("ddlsabzilunch2").style.visibility='hidden';
                document.getElementById("ddlsabzilunch3").style.visibility='hidden';
                document.getElementById("ddlsabzilunch4").style.visibility='hidden';
                document.getElementById("txtcostOfsabzilunch2").style.visibility='hidden';
                document.getElementById("txtcostOfsabzilunch3").style.visibility='hidden';
                document.getElementById("txtcostOfsabzilunch4").style.visibility='hidden';
                document.getElementById("ddlsabzidinner2").style.visibility='hidden';
                document.getElementById("ddlsabzidinner3").style.visibility='hidden';
                document.getElementById("ddlsabzidinner4").style.visibility='hidden';
                document.getElementById("txtcostOfSabzidinner2").style.visibility='hidden';
                document.getElementById("txtcostOfSabzidinner3").style.visibility='hidden';
                document.getElementById("txtcostOfSabzidinner4").style.visibility='hidden';
            }
            function ddlsabzitypedinnerchange(){
               
                var count=document.getElementById("ddlNoOFSabzidinner").value;
                if(count == 2){
                     document.getElementById("ddlsabzidinner2").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner2").style.visibility='visible';
                     document.getElementById("ddlsabzidinner3").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner3").style.visibility='hidden';
                     document.getElementById("ddlsabzidinner4").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner4").style.visibility='hidden';
                }
                else if(count==3){
                     document.getElementById("ddlsabzidinner2").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner2").style.visibility='visible';
                     document.getElementById("ddlsabzidinner3").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner3").style.visibility='visible';
                     document.getElementById("ddlsabzidinner4").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner4").style.visibility='hidden';
                }
                else if(count==4){
                     document.getElementById("ddlsabzidinner2").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner2").style.visibility='visible';
                      document.getElementById("ddlsabzidinner3").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner3").style.visibility='visible';
                      document.getElementById("ddlsabzidinner4").style.visibility='visible';
                     document.getElementById("txtcostOfSabzidinner4").style.visibility='visible';
                }
                else{
                     document.getElementById("ddlsabzidinner2").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner2").style.visibility='hidden';
                     document.getElementById("ddlsabzidinner3").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner3").style.visibility='hidden';
                     document.getElementById("ddlsabzidinner4").style.visibility='hidden';
                     document.getElementById("txtcostOfSabzidinner4").style.visibility='hidden';
                }
            }
            function ddlsabzitypelunchchange(){
                var count=document.getElementById("ddlNoOFSabzilunch").value;
                if(count == 2){
                     document.getElementById("ddlsabzilunch2").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch2").style.visibility='visible';
                     document.getElementById("ddlsabzilunch3").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch3").style.visibility='hidden';
                     document.getElementById("ddlsabzilunch4").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch4").style.visibility='hidden';
                }
                else if(count==3){
                     document.getElementById("ddlsabzilunch2").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch2").style.visibility='visible';
                     document.getElementById("ddlsabzilunch3").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch3").style.visibility='visible';
                     document.getElementById("ddlsabzilunch4").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch4").style.visibility='hidden';
                }
                else if(count==4){
                     document.getElementById("ddlsabzilunch2").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch2").style.visibility='visible';
                      document.getElementById("ddlsabzilunch3").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch3").style.visibility='visible';
                      document.getElementById("ddlsabzilunch4").style.visibility='visible';
                     document.getElementById("txtcostOfsabzilunch4").style.visibility='visible';
                }
                else{
                     document.getElementById("ddlsabzilunch2").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch2").style.visibility='hidden';
                     document.getElementById("ddlsabzilunch3").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch3").style.visibility='hidden';
                     document.getElementById("ddlsabzilunch4").style.visibility='hidden';
                     document.getElementById("txtcostOfsabzilunch4").style.visibility='hidden';
                }
            }
          function submitLunch(){
              var noOfSabzi=document.getElementById("ddlNoOFSabzilunch").value;
              var sabzi1=document.getElementById("ddlsabzilunch1").value;
              var costOfsabzi1= document.getElementById("txtcostOfsabzilunch1").value;
              alert('here');
              var sabzi2=document.getElementById("ddlsabzilunch2").value;
              var costOfsabzi2= document.getElementById("txtcostOfsabzilunch2").value;
              var sabzi3=document.getElementById("ddlsabzilunch3").value;
              var costOfsabzi3= document.getElementById("txtcostOfsabzilunch3").value;
              var sabzi4=document.getElementById("ddlsabzilunch4").value;
              var costOfsabzi4= document.getElementById("txtcostOfsabzilunch4").value;
              var url='../Controller?action=uploadUpdateMenuPage&btnUpdateMenulunch=lunch&noOfSabzi='+noOfSabzi+'&sabzi1='+sabzi1+'&costOfsabzi1='+costOfsabzi1+'&sabzi2='+sabzi2+'&costOfsabzi2='+costOfsabzi2+'&sabzi3='+sabzi3+'&costOfsabzi3='+costOfsabzi3+'&sabzi4='+sabzi4+'&costOfsabzi4='+costOfsabzi4;
              alert(url);
              window.location.href = '../Controller?action=uploadUpdateMenuPage&btnUpdateMenulunch=lunch';
          }
        </script>
    </head>
    <body class="bg_d" onload="controlVisibility()">
       <!-- <form action="../Controller?action=uploadUpdatedMenu" method="get" name="submission" >-->

        <!-- main wrapper (without footer) -->
        <div class="main-wrapper">
            <!-- top bar -->
            <jsp:include page="nav.jsp"></jsp:include>
            <!-- header -->
            <jsp:include page="header.jsp"></jsp:include>
           
            <!-- breadcrumbs -->
            <div class="container">
                <ul id="breadcrumbs">
                    <li><a href="javascript:void(0)"><i class="icon-home"></i></a></li>
                    <li><a href="javascript:void(0)">Menu</a></li>
                    <li><a href="javascript:void(0)">Update Menu...</a></li>
                </ul>
            </div>

            <!-- main content -->
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>Lunch</h4>
                            </div>
                            <div class="w-box-content">
                                <form id="validate_field_types">
                                    <div class="formSep">
                                        <div class="w-box w-box-blue">
                                            <div class="w-box-header">
                                                Sabzi
                                            </div>
                                            <div class="w-box-content cnt_a">
                                                <table id="table-stacking-simple" class="table stackable">

                                                   <tbody>
                                                        <tr>
                                                            <td>Number of subzi offered :</td>
                                                            <td>
                                                                <select name="ddlNoOFSabzilunch" id="ddlNoOFSabzilunch" class="span12" onchange="ddlsabzitypelunchchange()">
                                                                    <option id="1">1</option>
                                                                    <option id="2">2</option>
                                                                    <option id="3">3</option>
                                                                    <option id="4">4</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>Select Sabzi:</th>
                                                            <th>Cost of each Sabzi</th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <c:forEach begin="1" end="4" var="i">

                                                        <select  name="ddlsabzilunch${i}" id="ddlsabzilunch${i}" >
                                                                         <c:forEach items="${itemlist}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <input type="text" name="txtcostOfsabzilunch${i}" id="txtcostOfsabzilunch${i}" >

                                                                <br/>

                                                            </c:forEach>
                                                            </tr>
                                                    </tbody>
                                                </table>
                                              
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-blue">
                                            <div class="w-box-header">
                                                Dal
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select dal type :</td>
                                                            <td>
                                                                <select name="ddlDalTypelunch" id="ddlDalTypelunch" class="span12">
                                                                    <option>Add Dal Type</option>
                                                                      <c:forEach items="${itemlistDal}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                      </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtDalPrizelunch" id="txtDalPrizelunch" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-blue">
                                            <div class="w-box-header">
                                                Roti
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select roti type :</td>
                                                            <td>
                                                                <select name="ddlRotiTypelunch" id="ddlRotiTypelunch" class="span12">
                                                                    <option>Add roti Type</option>
                                                                     <c:forEach items="${itemlistRoti}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                      </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtRotiPricelunch" id="txtRotiPricelunch" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-blue">
                                            <div class="w-box-header">
                                                Rice
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select rice type :</td>
                                                            <td>
                                                                <select name="ddlRiceTypelunch" id="ddlRiceTypelunch" class="span12">
                                                                    <option>Add rice Type</option>
                                                                     <c:forEach items="${itemlistRice}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                      </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtRicePricelunch" id="txtRicePricelunch" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="formSep">
                                        <label class="req">Checkbox</label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxSaladlunch" id="cbxSaladlunch" >
                                            Salad
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxPicklelunch" id="cbxPicklelunch">
                                            Pickle
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxPapadlunch" id="cbxPapadlunch">
                                            Papad
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxButterMilklunch" id="cbxButterMilklunch">
                                            Butter Milk (Chaas)
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxCurdlunch" id="cbxCurdlunch" >
                                            Curd (Dahi)
                                        </label>
                                        <!--<label class="checkbox">
                                            <input type="checkbox" name="cbxOtherslunch" id="cbxOtherslunch">
                                            Others
                                        </label>
                                        <input value="" placeholder="Rs." class="span3" type="text" name="txtOtherPricelunch" id="txtOtherPricelunch" />
                                        -->
                                    </div>
                                    <div class="formSep">
                                        <button type="button" class="btn" name="btnUpdateMenulunch" id="btnUpdateMenulunch" onclick="submitLunch()">Update Menu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="span6">
                        <div class="w-box">
                            <div class="w-box-header">
                                <h4>Dinner</h4>
                            </div>
                            <div class="w-box-content">
                                <form id="validate_field_types">
                                    <div class="formSep">
                                        <div class="w-box w-box-green">
                                            <div class="w-box-header">
                                                Sabzi
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Number of subzi offered :</td>
                                                            <td>
                                                                <select name="ddlNoOFSabzidinner" id="ddlNoOFSabzidinner" class="span12" onchange="ddlsabzitypedinnerchange()">
                                                                    <option id="1">1</option>
                                                                    <option id="2">2</option>
                                                                    <option id="3">3</option>
                                                                    <option id="4">4</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>Select Sabzi:</th>
                                                            <th>Cost of each Sabzi</th>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <c:forEach begin="1" end="4" var="i">

                                                        <select  name="ddlsabzidinner${i}" id="ddlsabzidinner${i}" >
                                                                         <c:forEach items="${itemlist}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                    <input type="text" name="txtcostOfsabzidinner${i}" id="txtcostOfSabzidinner${i}" >

                                                                <br/>

                                                            </c:forEach>
                                                            </tr>
                                                    </tbody>
                                                </table>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-green">
                                            <div class="w-box-header">
                                                Dal
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select dal type :</td>
                                                            <td>
                                                                <select name="ddlDalTypedinner" id="ddlDalTypedinner" class="span12">
                                                                    <option>Add Dal Type</option>
                                                                    <c:forEach items="${itemlistDal}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                     </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtDalPrizedinner" id="txtDalPrizedinner" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-green">
                                            <div class="w-box-header">
                                                Roti
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select roti type :</td>
                                                            <td>
                                                                <select name="ddlRotiTypedinner" id="ddlRotiTypedinner" class="span12">
                                                                    <option>Add roti Type</option>
                                                                    <c:forEach items="${itemlistRoti}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                      </c:forEach>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtRotiPricedinner" id="txtRotiPricedinner" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="formSep">
                                        <div class="w-box w-box-green">
                                            <div class="w-box-header">
                                                Rice
                                            </div>
                                            <div class="w-box-content cnt_a">

                                                <table id="table-stacking-simple" class="table stackable">

                                                    <tbody>
                                                        <tr>
                                                            <td>Select rice type :</td>
                                                            <td>
                                                                <select name="ddlRiceTypedinner" id="ddlRiceTypedinner" class="span12">
                                                                    <option>Add rice Type</option>
                                                                    <c:forEach items="${itemlistRice}" var="item">
                                                                            <option value="${item.itemID}">${item.itemName}</option>
                                                                      </c:forEach>

                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Price :</td>
                                                            <td>
                                                                <input value="" placeholder="Rs." class="span2" type="text" name="txtRicePricedinner" id="txtRicePricedinner" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="formSep">
                                        <label class="req">Checkbox</label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxSaladdinner" id="cbxSaladdinner" >
                                            Salad
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxPickledinner" id="cbxPickledinner">
                                            Pickle
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxPapaddinner" id="cbxPapaddinner">
                                            Papad
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxButterMilkdinner" id="cbxButterMilkdinner">
                                            Butter Milk (Chaas)
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxCurddinner" id="cbxCurddinner" >
                                            Curd (Dahi)
                                        </label>
                                        <label class="checkbox">
                                            <input type="checkbox" name="cbxOthersdinner" id="cbxOthersdinner">
                                            Others
                                        </label>
                                        <input value="" placeholder="Rs." class="span3" type="text" name="txtOtherPricedinner" id="txtOtherPricedinner" />
                                    </div>
                                    <div class="formSep">
                                        <button type="button" class="btn" name="btnUpdateMenudinner" id="btnupdateMenudinner">Update Menu</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer_space"></div>


        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Common JS -->
        <jsp:include page="commonJs.jsp"></jsp:include>

        <!-- Dashboard JS -->
        <!-- jQuery UI -->
        <script src="js/lib/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
        <!-- touch event support for jQuery UI -->
        <script src="js/lib/jquery-ui/jquery.ui.touch-punch.min.js"></script>
        <!-- colorbox -->
        <script src="js/lib/colorbox/jquery.colorbox.min.js"></script>
        <!-- fullcalendar -->
        <script src="js/lib/fullcalendar/fullcalendar.min.js"></script>
        <!-- flot charts -->
        <script src="js/lib/flot-charts/jquery.flot.js"></script>
        <script src="js/lib/flot-charts/jquery.flot.resize.js"></script>
        <script src="js/lib/flot-charts/jquery.flot.pie.js"></script>
        <script src="js/lib/flot-charts/jquery.flot.orderBars.js"></script>
        <script src="js/lib/flot-charts/jquery.flot.tooltip.js"></script>
        <script src="js/lib/flot-charts/jquery.flot.time.js"></script>
        <!-- responsive carousel -->
        <script src="js/lib/carousel/plugin.min.js"></script>
        <!-- responsive image grid -->
        <script src="js/lib/wookmark/jquery.imagesloaded.min.js"></script>
        <script src="js/lib/wookmark/jquery.wookmark.min.js"></script>

        <script src="js/pages/beoro_dashboard.js"></script>

        <script>
            if ($(window).width() > '1280') {
                $('body').append('<a href="javascript:void" class="fluid_lay" style="position:fixed;top:6px;right:10px;z-index:10000" title="fluid layout"><i class="splashy-arrow_state_grey_left"></i><i class="splashy-arrow_state_grey_right"></i></a>');
                $('.fluid_lay').click(function() {
                    var url = window.location.href;
                    if (url.indexOf('?') > -1) {
                        url += '&fluid=1'
                    } else {
                        url += '?fluid=1'
                    }
                    window.location.href = url;
                });
                $(window).on('resize', function() {
                    if ($(window).width() > '1280') {
                        $('.fluid_lay').show();
                    } else {
                        $('.fluid_lay').hide();
                    }
                })
            }
        </script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-37020220-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();

        </script>
       <!--</form>-->
    </body>
</html>
