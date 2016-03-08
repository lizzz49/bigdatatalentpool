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
  <jsp:include page="../head.jsp" flush="true"></jsp:include>
</head>
<body>
<div class="site">
  <%--头部--%>
  <jsp:include page="../header.jsp" flush="true"></jsp:include>
  <%--头部--%>
    <div class="noo-page-heading">
      <div class="container-boxed max parallax-content">
        <div class="page-heading-info">
          <h1 class="page-title">人才列表
            <c:if test="${loginType == null or loginType == ''}">
              <span class="count">登录将拥有查询的功能</span>
              <a href="<%=basePath%>login" class="btn btn-primary">立即登陆</a>
            </c:if>
          </h1>
        </div>
      </div>
      <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
    </div>
    <div class="container-wrap">
      <div class="main-content container-boxed max offset">
        <%--查询表单--%>
          <c:if test="${loginType != null and loginType != ''}">
            <div class="row">
              <div class="col-md-12">
                <form class="form-inline">
                  <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username" placeholder="noprom">
                  </div>
                  <div class="form-group">
                    <label for="email">邮箱</label>
                    <input type="email" class="form-control" id="email" placeholder="tyee.noprom@qq.com">
                  </div>
                  <div class="form-group">
                    <label for="job">工作</label>
                    <input type="text" class="form-control" id="job" placeholder="数据分析师">
                  </div>
                  <div class="form-group">
                    <label for="phone">手机</label>
                    <input type="text" class="form-control" id="phone" placeholder="18810965227">
                  </div>
                  <button type="button" class="btn btn-primary btn-lg query-btn">查 询</button>
                </form>
              </div>
            </div>
          </c:if>
        <%--数据列表--%>
        <div id="people-list"></div>
        <%--数据列表--%>
      </div>
    </div>
  <%--底部--%>
  <jsp:include page="../footer.jsp" flush="true"></jsp:include>
  <%--底部--%>
</div>
<%--js--%>
<jsp:include page="../js.jsp" flush="true"></jsp:include>
<%--js--%>

<script>
  jQuery('document').ready(function ($) {
    loadList();

    // 查询
    $(".query-btn").on('click', function () {
        loadList();
    });

    // 加载数据列表
    function loadList() {
      // 收集查询参数
      var param = buildParam();
      var page = $("#page").val();
      if(isEmpty(page) || page == 0){
        page = 1;
      }
      // 查询列表
      $.ajax({
        url : "<%=basePath%>loadPeople",
        data : 'page='+page+"&param="+param,
        success  : function(data) {
          $("#people-list").html(data);
        }
      });
    }

    // 收集参数
    function buildParam() {
      var param = {};
      var username = $("#username").val();
      var email = $("#email").val();
      var job = $("#job").val();
      var phone = $("#phone").val();
      if (!isEmpty(username)) {
        param["username"] = username;
      }
      if (!isEmpty(email)) {
        param["email"] = email;
      }
      if (!isEmpty(job)) {
        param["job"] = job;
      }
      if (!isEmpty(phone)) {
        param["phone"] = phone;
      }
      return JSON.stringify(param);
    }

    /**
     * 校验是否为空
     * @param str
     * @returns {Boolean}
     */
    function isEmpty(str) {
      if (!str || $.trim(str).length <= 0)
        return true;
      return false;
    }
  });
</script>
<jsp:include page="../modal.jsp" flush="true"></jsp:include>
</body>
</html>