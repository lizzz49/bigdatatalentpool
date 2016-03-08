<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<a href="#" class="go-to-top hidden-print"><i class="fa fa-angle-up"></i></a>

<script type='text/javascript' src='<%=basePath%>job/js/jquery.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery-migrate.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/modernizr-2.7.1.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.cookie.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.blockUI.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/imagesloaded.pkgd.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/isotope-2.0.0.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.touchSwipe.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/bootstrap.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/hoverIntent-r7.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/superfish-1.7.4.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/script.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/chosen.jquery.min.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.datetimepicker.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.parallax-1.1.3.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/jquery.carouFredSel-6.2.1-packed.js'></script>
<script type='text/javascript' src='<%=basePath%>job/js/custom.js'></script>
<script type='text/javascript' src="<%=basePath%>job/js/plugins/toastr/toastr.min.js"></script>
<script type='text/javascript' src="<%=basePath%>job/js/validation.js"></script>
<script type="text/javascript">
    <%--Toastr配置--%>
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-center",
        "onclick": null,
        "showDuration": "50",
        "hideDuration": "100",
        "timeOut": "1200",
        "extendedTimeOut": "100",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    jQuery('document').ready(function ($) {
        // 发布简历之前检查
        $(".add-new-resume").on('click', function(){
            $.ajax({
                url : "<%=basePath%>postResume",
                data: {
                    "id" : 1
                },
                method : "post",
                dataType : "json",
                success : function(data) {
                    if (data.status == 'SUCCESS') {
                        window.location.href = bathPath + "postInfo";
                    } else {
                        toastr.error(data.info);
                        return false;
                    }
                }
            });
        });
    });
</script>