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
          <h1 class="page-title">简历列表
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
                    <label for="title">标题</label>
                    <input type="text" class="form-control" id="title" placeholder="">
                  </div>
                  <div class="form-group">
                    <label for="highestDegree">学历</label>
                    <input type="text" class="form-control" id="highestDegree" placeholder="研究生">
                  </div>
                  <div class="form-group">
                    <label for="experience">经验</label>
                    <input type="text" class="form-control" id="experience" placeholder="2年">
                  </div>
                  <button type="button" class="btn btn-primary btn-lg query-btn">查 询</button>
                </form>
              </div>
            </div>
          </c:if>
        <%--数据列表--%>
        <div id="resume-list"></div>
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
        url : "<%=basePath%>loadResume",
        data : 'page='+page+"&param="+param,
        success  : function(data) {
          $("#resume-list").html(data);
        }
      });
    }

    // 收集参数
    function buildParam() {
      var param = {};
      var title = $("#title").val();
      var highestDegree = $("#highestDegree").val();
      var experience = $("#experience").val();
      if (!isEmpty(title)) {
        param["title"] = title;
      }
      if (!isEmpty(highestDegree)) {
        param["highestDegree"] = highestDegree;
      }
      if (!isEmpty(experience)) {
        param["experience"] = experience;
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