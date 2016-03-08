<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header class="noo-header" id="noo-header">
  <div class="navbar-wrapper">
    <div class="navbar navbar-default fixed-top shrinkable">
      <div class="container-boxed max">
        <div class="navbar-header">
          <h1 class="sr-only">BigData Talent Bank</h1>
          <a class="navbar-toggle collapsed" data-toggle="collapse" data-target=".noo-navbar-collapse">
            <span class="sr-only">导航</span>
            <i class="fa fa-bars"></i>
          </a>
          <a class="navbar-toggle member-navbar-toggle collapsed" data-toggle="collapse" data-target=".noo-user-navbar-collapse">
            <i class="fa fa-user"></i>
          </a>
          <a href="./" class="navbar-brand">
            <img class="noo-logo-img noo-logo-normal" src="<%=basePath%>job/images/logo.jpg" alt="">
            <img class="noo-logo-mobile-img noo-logo-normal" src="<%=basePath%>job/images/logo-mobile.png" alt="">
          </a>
        </div>
        <nav class="collapse navbar-collapse noo-user-navbar-collapse">
          <ul class="navbar-nav sf-menu">
            <li>
              <a href="<%=basePath%>login"><i class="fa fa-sign-in"></i> 登录</a>
            </li>
            <li>
              <a href="<%=basePath%>reg"><i class="fa fa-key"></i> 注册</a>
            </li>
          </ul>
        </nav>
        <nav class="collapse navbar-collapse noo-navbar-collapse">
          <ul class="navbar-nav sf-menu">
            <li class="<c:if test="${url == '/'}">current-menu-item</c:if> align-left">
              <a href="<%=basePath%>">首页</a>
            </li>
            <li class="<c:if test="${url == '/people'}">current-menu-item</c:if> align-left">
              <a href="<%=basePath%>people">人才</a>
            </li>
            <li class="<c:if test="${url == '/resume'}">current-menu-item</c:if> align-left">
              <a href="<%=basePath%>resume">简历</a>
            </li>
            <c:choose>
              <c:when test="${sessionScope.USERINFO == null}">
                <li class="menu-item-post-btn">
                  <a href="<%=basePath%>login">发布简历</a>
                </li>
              </c:when>
              <c:when test="${LOGIN_TYPE == 'Employee'}">
                <li class="menu-item-post-btn">
                  <a href="javascript:void(0);" class="add-new-resume">发布简历</a>
                </li>
              </c:when>
            </c:choose>

            <c:choose>
              <c:when test="${sessionScope.LOGIN_TYPE == 'Employee'}">
                <li class="nav-item-member-profile login-link">
              <a href="#" class="sf-with-ul">
                <span class="profile-name">${sessionScope.USERINFO.username}</span>
                <span class="profile-avatar">
                  <img alt="" src="
                  <c:choose>
                    <c:when test="${USERINFO.avatar != null and USERINFO.avatar != ''}"><%=basePath%>upload/avatar/${USERINFO.avatar}</c:when>
                    <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
                  </c:choose>
                  " height="40" width="40">
                </span>
              </a>
              <ul class="sub-menu">
                <li><a href="javascript:void(0);" class="add-new-resume"><i class="fa fa-edit"></i> 发布简历</a></li>
                <li><a href="<%=basePath%>user/resume"><i class="fa fa-newspaper-o"></i> 我的简历</a></li>
                <c:choose>
                  <c:when test="${sessionScope.USERINFO.phone != null}">
                    <li><a href="<%=basePath%>user"><i class="fa fa-user"></i> 我的账户</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="<%=basePath%>user/account"><i class="fa fa-user"></i> 我的账户</a></li>
                  </c:otherwise>
                </c:choose>
                <li class="divider"></li>
                <li><a href="<%=basePath%>logout"><i class="fa fa-sign-out"></i> 退出登录</a></li>
              </ul>
            </li>
              </c:when>
              <c:when test="${sessionScope.LOGIN_TYPE == 'Employer'}">
                <li class="nav-item-member-profile login-link align-right">
                  <a href="#" class="sf-with-ul">
                    <span class="profile-name">${sessionScope.USERINFO.username}</span>
                    <span class="profile-avatar">
                      <img alt="" src="<%=basePath%>job/images/avatar/anonymous.png" height="40" width="40">
                    </span>
                  </a>
                  <ul class="sub-menu">
                    <li><a href="<%=basePath%>logout"><i class="fa fa-sign-out"></i> 退出登录</a></li>
                  </ul>
                </li>
              </c:when>
              <c:otherwise>
                <li class="nav-item-member-profile login-link align-center">
                  <a href="#" class="member-links member-login-link" data-rel="loginModal">
                  <i class="fa fa-sign-in"></i>&nbsp;登录
                </a>
                </li>
                <li class="nav-item-member-profile register-link">
                  <a class="member-links member-register-link" href="#" data-rel="registerModal">
                    <i class="fa fa-key"></i>&nbsp;注册
                  </a>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</header>