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
            <c:when test="${USERINFO.avatar != null}"><%=basePath%>upload/avatar/${USERINFO.avatar}</c:when>
            <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
          </c:choose>
          ' height='100' width='100'/>
        </div>
        <div class="page-heading-info ">
          <h1 class="page-title">简历详情</h1>
        </div>
        <div class="page-sub-heading-info">
          查看简历
        </div>
      </div>
      <div class="parallax heading" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
    </div>
    <div class="container-wrap">
      <div class="main-content container-fullwidth">
        <div class="row">
          <div class="noo-main col-md-12">
            <div class="jform">
              <div class="jform-header">

              </div>
              <div class="jform-body">
                <div class="container-boxed max">
                  <form class="form-horizontal">
                    <div class="jstep-content">
                      <div class="jpanel jpanel-resume-form">
                        <div class="jpanel-title">
                          <h3>${CURRENT_RESUME.title}</h3>
                        </div>
                        <div class="jpanel-body">
                          <div class="jpanel jpanel-resume-preview">
                            <div class="jpanel-body">
                              <div class="resume-preview">
                                <div class="resume-form-detail">
                                  <article class="resume">
                                    <div class="resume-candidate-profile">
                                      <div class="row">
                                        <div class="col-sm-3 profile-avatar">
                                          <img alt='' src='
                                <c:choose>
                                  <c:when test="${USERINFO.avatar != null}"><%=basePath%>upload/avatar/${USERINFO.avatar}</c:when>
                                  <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
                                </c:choose>
                                ' height='160' width='160' />
                                        </div>
                                        <div class="col-sm-9 candidate-detail">
                                          <div class="candidate-title clearfix">
                                            <h2>${sessionScope.USERINFO.username}</h2>
                                            <c:if test="${detail != 'true'}">
                                            <a class="btn btn-default pull-right" href="<%=basePath%>user">
                                              <i class="fa fa-pencil"></i>
                                              编辑资料
                                            </a>
                                            </c:if>
                                          </div>
                                          <div class="candidate-info">
                                            <div class="row">
                                              <div class="col-sm-6">
                                                <i class="fa fa-suitcase text-primary"></i>
                                                &nbsp;&nbsp;
                                                <c:choose>
                                                  <c:when test="${USERINFO.job != null}">${USERINFO.job}</c:when>
                                                  <c:otherwise>未填写</c:otherwise>
                                                </c:choose>
                                              </div>
                                              <div class="col-sm-6">
                                                <i class="fa fa-map-marker text-primary"></i>
                                                &nbsp;&nbsp;
                                                <c:choose>
                                                  <c:when test="${USERINFO.address != null}">${USERINFO.address}</c:when>
                                                  <c:otherwise>未填写</c:otherwise>
                                                </c:choose>
                                              </div>
                                              <div class="col-sm-6">
                                                <i class="fa fa-birthday-cake text-primary"></i>
                                                &nbsp;&nbsp;
                                                <c:choose>
                                                  <c:when test="${USERINFO.birthday != null}">
                                                    <fmt:formatDate value="${USERINFO.birthday}" pattern="yyyy-MM-dd"/>
                                                  </c:when>
                                                  <c:otherwise>未填写</c:otherwise>
                                                </c:choose>
                                              </div>
                                              <div class="col-sm-6">
                                                <i class="fa fa-phone text-primary"></i>
                                                &nbsp;&nbsp;
                                                <c:choose>
                                                  <c:when test="${USERINFO.phone != null}">${USERINFO.phone}</c:when>
                                                  <c:otherwise>未填写</c:otherwise>
                                                </c:choose>
                                              </div>
                                              <div class="col-sm-6 pull-right">
                                                <a href="mailto:email@domain.com">
                                                  <i class="fa fa-envelope text-primary"></i>
                                                  &nbsp;&nbsp;
                                                  <c:choose>
                                                    <c:when test="${USERINFO.email != null}">${USERINFO.email}</c:when>
                                                    <c:otherwise>未填写</c:otherwise>
                                                  </c:choose>
                                                </a>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <hr/>
                                    <div class="resume-content">
                                      <div class="row">
                                        <div class="col-md-12">
                                          <div class="resume-desc">
                                            <div class="resume-general row">
                                              <div class="col-sm-3">
                                                <h3 class="title-general">
                                                  <span>基本信息</span>
                                                </h3>
                                              </div>
                                              <div class="col-sm-9">
                                                <ul>
                                                  <li>
                                                    <span>最高学位</span>
                                                    ${CURRENT_RESUME.highestDegree}
                                                  </li>
                                                  <li>
                                                    <span>工作经验</span>
                                                    ${CURRENT_RESUME.experience}
                                                  </li>
                                                  <li>
                                                    <span>工作种类</span>
                                                    <c:forEach items="${BASIC_RESUME.categoryList}" var="v">
                                                      ${v.title}
                                                    </c:forEach>
                                                  </li>
                                                  <li>
                                                    <span>工作地点</span>
                                                    <c:forEach items="${BASIC_RESUME.cityList}" var="v">
                                                      ${v.name}
                                                    </c:forEach>
                                                  </li>
                                                </ul>
                                              </div>
                                              <div class="col-sm-12">
                                                <p>
                                                  ${CURRENT_RESUME.introduction}
                                                </p>
                                              </div>
                                            </div>
                                            <div class="resume-timeline row">
                                              <div class="col-md-3 col-sm-12">
                                                <h3 class="title-general">
                                                  <span>教育信息</span>
                                                </h3>
                                              </div>
                                              <div class="col-md-9 col-sm-12">
                                                <div class="timeline-container education">
                                                  <c:forEach items="${EDUCATION_LIST}" var="v" varStatus="s">
                                                    <div class="timeline-wrapper  <c:if test="${s.last}">last</c:if>  ">
                                                    <div class="timeline-time">
                                                      <span>${v.date}</span>
                                                    </div>
                                                      <c:if test="${detail != 'true'}">
                                                      <a href="javascript:void(0);" class="noo-remove-fields pull-right delete-edu" key="${v.id}">
                                                        <i class="fa fa-times-circle"></i>
                                                      </a>
                                                      </c:if>
                                                    <dl class="timeline-series">

                                                      <dt class="timeline-event">
                                                        <a>
                                                          ${v.school}<span>${v.qualification}</span>
                                                        </a>
                                                      </dt>

                                                      <dd class="timeline-event-content">
                                                        <p>${v.note}</p>
                                                        <br class="clear">
                                                      </dd>
                                                    </dl>

                                                  </div>
                                                  </c:forEach>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="resume-timeline row">
                                              <div class="col-md-3 col-sm-12">
                                                <h3 class="title-general">
                                                  <span>工作经历</span>
                                                </h3>
                                              </div>
                                              <div class="col-md-9 col-sm-12">

                                                  <div class="timeline-container experience">
                                                    <c:forEach items="${EXPERIENCE_LIST}" var="v" varStatus="s">
                                                      <div class="timeline-wrapper <c:if test="${s.last}">last</c:if> ">
                                                    <div class="timeline-time">
                                                      <span>${v.date}</span>
                                                    </div>
                                                        <c:if test="${detail != 'true'}">
                                                        <a href="javascript:void(0);" class="noo-remove-fields pull-right delete-exp" key="${v.id}">
                                                          <i class="fa fa-times-circle"></i>
                                                        </a>
                                                        </c:if>
                                                    <dl class="timeline-series">

                                                      <dt class="timeline-event">
                                                        <a>${v.title}</a>
                                                      </dt>
                                                      <dd class="timeline-event-content">
                                                        <p>${v.note}</p>
                                                        <br class="clear">
                                                      </dd>
                                                    </dl>
                                                  </div>
                                                    </c:forEach>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="resume-timeline row">
                                              <div class="col-md-3 col-sm-12">
                                                <h3 class="title-general">
                                                  <span>掌握技能</span>
                                                </h3>
                                              </div>
                                              <div class="col-md-9 col-sm-12">
                                                <div class="skill">
                                                  <c:forEach items="${SKILL_LIST}" var="v" varStatus="s">
                                                    <div class="pregress-bar clearfix">
                                                    <div class="progress_title">
                                                      <span>${v.name}</span>
                                                    </div>
                                                      <c:if test="${detail != 'true'}">
                                                      <a href="javascript:void(0);" class="noo-remove-fields pull-right delete-skill" key="${v.id}">
                                                        <i class="fa fa-times-circle"></i>
                                                      </a>
                                                      </c:if>
                                                    <div class="progress">
                                                      <div role="progressbar" aria-valuemax="100" aria-valuemin="0" class="progress-bar progress-bar-bg" aria-valuenow="90" style="width: 90%;">
                                                        <div class="progress_label"><span>${v.percent}</span>%</div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  </c:forEach>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </article>
                                  <div class="form-actions resume-preview-actions text-center clearfix">
                                    <a href="<%=basePath%>user/resume" class="btn btn-primary">返 回</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
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

    // 删除教育信息
    $(".delete-edu").on('click', function(){
      var id = $(this).attr('key');
      $.ajax({
        url : "<%=basePath%>deleteEdu",
        data: {
          "id" : id
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

    // 删除工作经验
    $(".delete-exp").on('click', function(){
      var id = $(this).attr('key');
      $.ajax({
        url : "<%=basePath%>deleteExp",
        data: {
          "id" : id
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

    // 删除技能
    $(".delete-skill").on('click', function(){
      var id = $(this).attr('key');
      $.ajax({
        url : "<%=basePath%>deleteSkill",
        data: {
          "id" : id
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
  });

</script>
</body>
</html>