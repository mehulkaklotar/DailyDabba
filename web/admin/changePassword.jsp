<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en-US">
    <head>

        <meta charset="UTF-8">
        <title>Admin Panel</title>
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <link rel="icon" type="image/ico" href="favicon.ico">
        <!-- common stylesheets -->
        <jsp:include page="commonStyle.jsp"></jsp:include>
            <!-- Common JS -->
        <jsp:include page="commonJs.jsp"></jsp:include>
        </head>
        <body class="bg_d">
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
                        <li><span>Change Password...</span></li>
                    </ul>
                </div>

                <!-- main content -->
                <div class="container">
                    <div class="row-fluid">
                        <div class="span12">
                        <c:if test="${error != null}">
                            <label class="alert alert-error">
                                ${error}
                            </label>
                        </c:if>

                        <form class="form-horizontal" id="frmChangePassword" action="AdminController?action=changePassword" method="post">

                            <div class="alert alert-error hide">
                                <button class="close" data-dismiss="alert"></button>
                                You have some form errors. Please check below.
                            </div>
                            <div class="alert alert-success hide">
                                <button class="close" data-dismiss="alert"></button>
                                Your form validation is successful!
                            </div>
                            <fieldset>
                                <legend>Change Password</legend>
                                <div class="control-group">
                                    <label class="control-label" for="lblItemName">Old Password:</label>
                                    <div class="controls">
                                        <input type="password" id="txtOldPassword" value="" name="txtOldPassword" placeholder="Type here...">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="lblItemName">New Password:</label>
                                    <div class="controls">
                                        <input type="password" id="txtNewPassword" value="" name="txtNewPassword" placeholder="Type here...">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn">Update password</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_space"></div>
    </div> 

    <!-- footer --> 
    <jsp:include page="footer.jsp"></jsp:include>


    <!-- validation -->
    <script src="js/jquery.validate.js"></script>
    <script type="text/javascript">

        $(document).ready(function() {
            var form1 = $('#frmChangePassword');
            var error1 = $('.alert-error', form1);
            var success1 = $('.alert-success', form1);
            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-inline', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",
                rules: {
                    txtOldPassword: {
                        required: true
                    },
                    txtNewPassword: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                    }
                },
                invalidHandler: function(event, validator) {//display error alert on form submit
                    success1.hide();
                    error1.show();
                },
                highlight: function(element) {// hightlight error inputs
                    $(element).closest('.help-inline').removeClass('ok');
                    // display OK icon
                    $(element).closest('.control-group').removeClass('success').addClass('error');
                    // set error class to the control group
                },
                unhighlight: function(element) {// revert the change done by hightlight
                    $(element).closest('.control-group').removeClass('error');
                    // set error class to the control group
                },
                success: function(label) {
                    label.addClass('valid').addClass('help-inline ok')// mark the current input as valid and display OK icon
                            .closest('.control-group').removeClass('error').addClass('success');
                    // set success class to the control group
                },
                submitHandler: function(form) {
                    success1.show();
                    form.submit();
                    error1.hide();
                }
            });
        });
    </script>
    <!-- validation end -->

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
</body>


</html>
