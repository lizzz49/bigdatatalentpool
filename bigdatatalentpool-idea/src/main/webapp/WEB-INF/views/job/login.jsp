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
        <div class="page-heading-info ">
          <h1 class="page-title">会员中心 </h1>
        </div>
        <div class="page-sub-heading-info">
          注册｜登录
        </div>
      </div>
      <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
    </div>
    <div class="container-wrap">
      <div class="main-content container-boxed max offset">
        <div class="row">
          <div class="noo-main col-md-12">
            <div class="account-form show-login-form-links">
              <div class="account-log-form">
                <form class="form-horizontal" id="login-form-user">
                  <div class="form-group row">
                    <label class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-9">
                      <input type="text" class="log form-control" name="username" id="username" required placeholder="用户名">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-9">
                      <input type="password" class="pwd form-control" required value="" name="password" placeholder="密码">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-sm-3 control-label">我要</label>
                    <div class="col-sm-9">
                      <div class="form-control-flat">
                        <select class="user_role" name="role" required>
                          <option value="0">请选择</option>
                          <option value="1">找人才</option>
                          <option value="2">发简历</option>
                        </select>
                        <i class="fa fa-caret-down"></i>
                      </div>
                    </div>
                  </div>
                  <div class="form-actions form-group text-center">
                    <button type="button" class="btn btn-primary" id="login-btn-user">登 录</button>
                    <div class="login-form-links">
                      <span>还没有账户?<a href="#" class="member-links member-register-link" data-rel="registerModal">免费注册 <i class="fa fa-long-arrow-right"></i></a></span>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%--底部--%>
  <jsp:include page="footer.jsp" flush="true"></jsp:include>
  <%--底部--%>
</div>
<%--js--%>
<jsp:include page="js.jsp" flush="true"></jsp:include>
<%--js--%>

<script>
  jQuery('document').ready(function ($) {

    // 登录
    $("#login-btn-user").on('click', function () {
      login();
    });

    /**
     * 登录
     * @returns {boolean}
     */
    function login(){
      // 用户名
      var username = $("#login-form-user input[name=username]").val();
      // 密码
      var password = $("#login-form-user input[name=password]").val();
      // 类型
      var role = $("#login-form-user option:selected").val();

      // 数据校验
      if (role == 0) {
        toastr.error("请选择类型");
        return false;
      } else {
        var postUrl = "<%=basePath%>";
            postUrl += role == 1 ? "loginEmployer" : "loginEmployee";

        $.ajax({
          url : postUrl,
          data: $("#login-form-user").serialize(),
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              setTimeout(function(){
                window.location.href = "<%=basePath%>";
              }, 1000);
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
    }


    /**
     * 是否是指定长度
     * @param str
     * @param length
     */
    function isSpecifyLength(str,minLen,maxLen) {
      if ($.trim(str).length >= minLen && $.trim(str).length <= maxLen)
        return true;
      return false;
    }
  });
</script>
<jsp:include page="modal.jsp" flush="true"></jsp:include>
</body>
</html>