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
  <link rel="stylesheet" type="text/css" href="<%=basePath%>job/plugin/webuploader/webuploader.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>job/plugin/webuploader/image-upload/style.css">
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
        我的账户
      </div>
    </div>
    <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
  </div>
  <div class="member-heading">
    <div class="container-boxed max">
      <div class="member-heading-nav">
        <ul>
          <li><a href="<%=basePath%>user/resume"><i class="fa fa-newspaper-o"></i> 我的简历</a></li>
          <li class="divider" role="presentation"></li>
          <c:choose>
            <c:when test="${sessionScope.USERINFO.phone != null}">
              <li class="active"><a href="<%=basePath%>user"><i class="fa fa-user"></i> 我的账户</a></li>
            </c:when>
            <c:otherwise>
              <li class="active"><a href="<%=basePath%>user/account"><i class="fa fa-user"></i> 我的账户</a></li>
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
          <div class="form-title">
            <h3>修改资料</h3>
          </div>
          <form class="form-horizontal" enctype="multipart/form-data">
            <div class="candidate-profile-form row">
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="profile-email" class="col-sm-4 control-label">邮箱</label>
                  <div class="col-sm-8">
                    <input type="email" class="form-control" required id="profile-email" value="${USERINFO.email}" name="email" placeholder="请输入邮箱" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="current_job" class="col-sm-4 control-label">当前工作</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="current_job" value="${USERINFO.job}" name="current_job" placeholder="您的当前工作">
                  </div>
                </div>
                <div class="form-group">
                  <label for="birthday" class="col-sm-4 control-label">生日</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="birthday" value="<fmt:formatDate value="${USERINFO.birthday}" pattern="yyyy-MM-dd"/>" name="birthday" placeholder="您的生日">
                  </div>
                </div>
                <div class="form-group">
                  <label for="address" class="col-sm-4 control-label">地区</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="address" value="${USERINFO.address}" name="address" placeholder="所在地区">
                  </div>
                </div>
                <div class="form-group">
                  <label for="phone" class="col-sm-4 control-label">手机号</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="phone" value="${USERINFO.phone}" name="phone" placeholder="您的手机号">
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="form-group">
                  <label for="description" class="control-label">简介</label>
                  <textarea class="form-control" id="description" name="description" rows="8" placeholder="您的简介">${USERINFO.description}</textarea>
                </div>
                <div class="form-group">
                  <label class="control-label">头像</label>
                  <div class="col-sm-12" style="border: 3px dashed #e6e6e6;padding-bottom: 18px;padding-top: 18px;">
                    <div id="uploader">
                      <div class="queueList">
                        <div id="dndArea" class="placeholder">
                          <div id="filePicker"></div>
                          <p>或将照片拖到这里</p>
                        </div>
                      </div>
                      <div class="statusBar" style="display:none;">
                        <div class="progress">
                          <span class="text">0%</span>
                          <span class="percentage"></span>
                        </div>
                        <div class="info"></div>
                        <div class="btns">
                          <div class="uploadBtn">开始上传</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-primary" id="save-profile-btn">保存资料</button>
            </div>
          </form>
          <hr/>
          <div class="form-title">
            <h3>修改密码</h3>
          </div>
          <form class="form-horizontal">
            <div class="row">
              <div class="col-sm-12">
                <div class="form-group">
                  <label for="old_pass" class="col-sm-3 control-label">当前密码</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" required id="old_pass" value="" name="old_pass">
                  </div>
                </div>
                <div class="form-group">
                  <label for="new_pass" class="col-sm-3 control-label">新密码</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" required id="new_pass" value="" name="new_pass">
                  </div>
                </div>
                <div class="form-group">
                  <label for="new_pass_confirm" class="col-sm-3 control-label">确认密码</label>
                  <div class="col-sm-9">
                    <input type="password" class="form-control" required id="new_pass_confirm" value="" name="new_pass_confirm">
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-primary" id="save-pwd-btn">保存新密码</button>
            </div>
          </form>
          <hr/>
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
<!-- WebUploader -->
<script type="text/javascript" src="<%=basePath%>job/plugin/webuploader/webuploader.min.js"></script>
<script type="text/javascript" src="<%=basePath%>job/plugin/webuploader/image-upload/upload.js"></script>
<!-- WebUploader -->
<jsp:include page="../modal.jsp" flush="true"></jsp:include>

<script type="text/javascript">
  jQuery('document').ready(function ($) {

    // 日期选择框
    $("#birthday").datetimepicker({
      format: 'Y-m-d',
      timepicker: false,
      startDate:'1990/01/01',
      scrollMonth: false,
      scrollTime: false,
      scrollInput: false
    });

    // 保存资料
    $("#save-profile-btn").on('click', function(){
      // 当前工作
      var job = $("#current_job").val();
      // 生日
      var birthday = $("#birthday").val();
      // 地区
      var address = $("#address").val();
      // 手机号
      var phone = $("#phone").val();
      // 简介
      var description = $("#description").val();

      if (isEmpty(job)) {
        toastr.error("工作不能为空");
        return false;
      } else if (isEmpty(birthday)) {
        toastr.error("生日不能为空");
        return false;
      } else if (isEmpty(address)) {
        toastr.error("地区不能为空");
        return false;
      } else if (isEmpty(phone)) {
        toastr.error("手机号不能为空");
        return false;
      } else if (isEmpty(description)) {
        toastr.error("简介不能为空");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>user/updateProfile",
          data: {
            "job" : job,
            "birthday" : birthday,
            "address" : address,
            "phone" : phone,
            "description" : description
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              setTimeout(function(){
                window.location.href = bathPath + "user";
              }, 1000);
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
    });

    // 修改密码
    $("#save-pwd-btn").on('click', function () {
      var old_pass = $("#old_pass").val();
      var new_pass = $("#new_pass").val();
      var new_pass_confirm = $('#new_pass_confirm').val();
      if (isEmpty(old_pass)) {
        toastr.error("旧密码不能为空");
        return false;
      } else if (isEmpty(new_pass) || isEmpty(new_pass_confirm)) {
        toastr.error("新密码不能为空");
        return false;
      } else if (old_pass == new_pass) {
        toastr.error("新密码与旧密码不能一致");
        return false;
      } else if (new_pass != new_pass_confirm) {
        toastr.error("您输入的密码不一致");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>user/changePwd",
          data: {
            "old_pass" : old_pass,
            "new_pass" : new_pass
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              setTimeout(function() {
                window.location.href = bathPath + "user";
              }, 1000);
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
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