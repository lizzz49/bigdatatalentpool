<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
bathPath = "<%=basePath%>";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
<link rel="shortcut icon" href="<%=basePath%>job/images/favicon.ico"/>
<title>大数据人才简历库</title>
<link rel='stylesheet' href='<%=basePath%>job/css/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=basePath%>job/css/custom.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=basePath%>job/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=basePath%>job/css/jquery.datetimepicker.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=basePath%>job/css/chosen.css' type='text/css' media='all'/>
<link rel='stylesheet' href='<%=basePath%>job/css/plugins/toastr/toastr.min.css' type='text/css' media='all'/>

<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Droid+Serif:100,300,400,700,900,300italic,400italic,700italic,900italic' type='text/css' media='all'/>
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Montserrat:100,300,400,700,900,300italic,400italic,700italic,900italic' type='text/css' media='all'/>

<link rel='stylesheet' href='<%=basePath%>job/css/style-selector.css' type='text/css' media='all'/>

<link id="style-main-color" rel="stylesheet" href="<%=basePath%>job/css/colors/default.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
