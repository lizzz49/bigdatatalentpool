<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en-US">
<head>
    <jsp:include page="head.jsp" flush="true"></jsp:include>
</head>
<body>
<div class="site">
    <%--头部--%>
    <jsp:include page="header.jsp" flush="true"></jsp:include>
    <%--头部--%>
    <div class="noo-page-heading">
        <div class="container-boxed max text-center parallax-content">
            <div class="page-heading-info" style="font-size: 120px;">
                <h1 class="page-title">404 </h1>
            </div>
            <div class="page-sub-heading-info">
                页面未找到！ <a href="<%=basePath%>" style="color: #e6b706;">返回首页</a>
            </div>
        </div>
        <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
    </div>
    <%--底部--%>
    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    <%--底部--%>
</div>
<%--js--%>
<jsp:include page="js.jsp" flush="true"></jsp:include>
<%--js--%>
<jsp:include page="modal.jsp" flush="true"></jsp:include>
</body>
</html>