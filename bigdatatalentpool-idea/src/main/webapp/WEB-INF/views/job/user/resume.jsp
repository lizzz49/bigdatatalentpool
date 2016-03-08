<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <div class="container-boxed max text-center parallax-content">
      <div class="member-heading-avatar">
        <img alt='' src='
        <c:choose>
          <c:when test="${USERINFO.avatar != null and USERINFO.avatar != ''}"><%=basePath%>upload/avatar/${USERINFO.avatar}</c:when>
          <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
        </c:choose>
        ' height='100' width='100'/>
      </div>
      <div class="page-heading-info ">
        <h1 class="page-title">个人中心</h1>
      </div>
      <div class="page-sub-heading-info">
        我的简历
      </div>
    </div>
    <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
  </div>
  <div class="member-heading">
    <div class="container-boxed max">
      <div class="member-heading-nav">
        <ul>
          <li class="active"><a href="<%=basePath%>user/resume"><i class="fa fa-newspaper-o"></i> 我的简历</a></li>
          <li class="divider" role="presentation"></li>
          <c:choose>
            <c:when test="${sessionScope.USERINFO.phone != null}">
              <li><a href="<%=basePath%>user"><i class="fa fa-user"></i> 我的账户</a></li>
            </c:when>
            <c:otherwise>
              <li><a href="<%=basePath%>user/account"><i class="fa fa-user"></i> 我的账户</a></li>
            </c:otherwise>
          </c:choose>
          <li class="divider" role="presentation"></li>
          <li><a href="<%=basePath%>logout"><i class="fa fa-sign-out"></i> 退出登录</a></li>
        </ul>
      </div>
    </div>
  </div>
    <div class="container-wrap">
      <div class="main-content container-boxed max offset">
        <div class="row">
          <div class="noo-main col-md-12">
            <div class="member-manage">
              <h3>您共有 <span class="text-primary">${RESUME_COUNT}</span> 份简历</h3>
              <em><strong>注意:</strong> 只有一份简历可以被公开可见。</em>
              <form>
                <div class="member-manage-table">
                  <table class="table">
                    <thead>
                    <tr>
                      <th>标题</th>
                      <th class="hidden-xs hidden-sm">经验</th>
                      <th class="hidden-xs hidden-sm">状态</th>
                      <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${RESUME_LIST}" var="v">
                      <tr>
                      <td class="title-col">
                        <a href="<%=basePath%>user/resume/${v.id}"><strong>${v.title}</strong></a>
                      </td>
                      <td class="hidden-xs category-col">
                        <a href="javascript:void(0);"><strong>${v.experience}</strong></a>
                      </td>
                        <td class="hidden-xs category-col">
                          <a href="javascript:void(0);"><strong>
                            <c:choose>
                              <c:when test="${v.status == 1}">可见</c:when>
                              <c:when test="${v.status == 0}">不可见</c:when>
                            </c:choose>
                          </strong></a>
                        </td>
                      <td class="member-manage-actions text-center">
                        <a href="<%=basePath%>postInfo/${v.id}" class="member-manage-action" data-toggle="tooltip" title="编辑简历">
                          <i class="fa fa-pencil"></i>
                        </a>
                        <a href="javascript:void(0);" class="member-manage-action action-delete delete-resume" data-toggle="tooltip" title="删除简历" key="${v.id}">
                          <i class="fa fa-trash-o"></i>
                        </a>
                        <a href="javascript:void(0);" class="noo-resume-viewable update-resume-status" data-toggle="tooltip" title="
                        <c:choose>
                          <c:when test="${v.status == 1}">设为不可见</c:when>
                          <c:when test="${v.status == 0}">设为可见</c:when>
                        </c:choose>
                        " status="${v.status}" key="${v.id}">
                          <i class="fa fa-star-o"></i>
                        </a>
                      </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div class="member-manage-toolbar bottom-toolbar clearfix">
                  <div class="member-manage-page pull-left">
                    <a href="javascript:void(0);" class="btn btn-primary add-new-resume">创建新的简历</a>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  <%--底部--%>
  <jsp:include page="../footer.jsp" flush="true"></jsp:include>
  <%--底部--%>
</div>
<%--js--%>
<jsp:include page="../js.jsp" flush="true"></jsp:include>
<%--js--%>
<jsp:include page="../modal.jsp" flush="true"></jsp:include>

<script type="text/javascript">
  jQuery('document').ready(function ($) {

    // 删除简历
    $(".delete-resume").on('click', function () {
      var key = $(this).attr('key');
      $.ajax({
          url : "<%=basePath%>user/deleteResume",
          data: {
            "id" : key
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              setTimeout(function(){
                location.reload(true);
              }, 1000);
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
    });

    // 更新简历的状态
    $(".update-resume-status").on('click', function () {
      var key = $(this).attr('key');
      var status = $(this).attr('status');
      status = status == 1 ? 0 : 1;
      $.ajax({
        url : "<%=basePath%>user/updateResumeStatus",
        data: {
          "id" : key,
          "status" : status
        },
        method : "post",
        dataType : "json",
        success : function(data) {
          if (data.status == 'SUCCESS') {
            toastr.success(data.info);
            setTimeout(function(){
              location.reload(true);
            }, 1000);
          } else {
            toastr.error(data.info);
            return false;
          }
        }
      });
    });

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
</body>
</html>