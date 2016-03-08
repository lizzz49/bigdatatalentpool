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
            <c:otherwise><%=basePath%>job/images/avatar/anonymous_big.png</c:otherwise>
          </c:choose>
          ' height='100' width='100'/>
        </div>
        <div class="page-heading-info ">
          <h1 class="page-title">
            <c:choose>
              <c:when test="${resume != null}">编辑简历</c:when>
              <c:otherwise>发布简历</c:otherwise>
            </c:choose>
          </h1>
        </div>
        <div class="page-sub-heading-info">
          基本信息
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
                <div class="container-boxed max">
                  <div class="jform-steps">
                    <ul class="jsteps jsteps-4">
                      <li  class="active">
                        <span class="jstep-num">
                          <a href="javascript:void(0);">1</a>
                        </span>
                        <div class="jstep-line">
                          <span class="jstep-dot"></span>
                        </div>
                        <div class="jstep-label">基本信息</div>
                      </li>
                      <li>
                        <span class="jstep-num">
                          <a href="javascript:void(0);">2</a>
                        </span>
                        <div class="jstep-line">
                          <span class="jstep-dot"></span>
                        </div>
                        <div class="jstep-label">简历详情</div>
                      </li>
                      <li>
                        <span class="jstep-num">
                          <a href="javascript:void(0);">3</a>
                        </span>
                        <div class="jstep-line">
                          <span class="jstep-dot"></span>
                        </div>
                        <div class="jstep-label">预览</div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="jform-body">
                <div class="container-boxed max">
                  <form class="form-horizontal" enctype="multipart/form-data">
                    <div class="jstep-content">
                      <div class="jpanel jpanel-resume-form">
                        <div class="jpanel-title">
                          <h3>基本信息</h3>
                        </div>
                        <div class="jpanel-body">
                          <div class="resume-candidate-profile">
                            <div class="row">
                              <div class="col-sm-3 profile-avatar">
                                <img alt='' src='
                                <c:choose>
                                  <c:when test="${USERINFO.avatar != null and USERINFO.avatar != ''}"><%=basePath%>upload/avatar/${USERINFO.avatar}</c:when>
                                  <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
                                </c:choose>
                                ' height='160' width='160' />
                              </div>
                              <div class="col-sm-9 candidate-detail">
                                <div class="candidate-title clearfix">
                                  <h2>${sessionScope.USERINFO.username}</h2>
                                  <a class="btn btn-default pull-right" href="<%=basePath%>user">
                                    <i class="fa fa-pencil"></i>
                                    编辑资料
                                  </a>
                                </div>
                                <div class="candidate-info">
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <i class="fa fa-suitcase text-primary"></i>
                                      &nbsp;&nbsp;
                                      <c:choose>
                                        <c:when test="${sessionScope.USERINFO.job != null}">${sessionScope.USERINFO.job}</c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </div>
                                    <div class="col-sm-6">
                                      <i class="fa fa-map-marker text-primary"></i>
                                      &nbsp;&nbsp;
                                      <c:choose>
                                        <c:when test="${sessionScope.USERINFO.address != null}">${sessionScope.USERINFO.address}</c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </div>
                                    <div class="col-sm-6">
                                      <i class="fa fa-birthday-cake text-primary"></i>
                                      &nbsp;&nbsp;
                                      <c:choose>
                                        <c:when test="${sessionScope.USERINFO.birthday != null}">
                                          <fmt:formatDate value="${sessionScope.USERINFO.birthday}" pattern="yyyy-MM-dd"/>
                                        </c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </div>
                                    <div class="col-sm-6">
                                      <i class="fa fa-phone text-primary"></i>
                                      &nbsp;&nbsp;
                                      <c:choose>
                                        <c:when test="${sessionScope.USERINFO.phone != null}">${sessionScope.USERINFO.phone}</c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </div>
                                    <div class="col-sm-6 pull-right">
                                      <a href="mailto:email@domain.com">
                                        <i class="fa fa-envelope text-primary"></i>
                                        &nbsp;&nbsp;
                                        <c:choose>
                                          <c:when test="${sessionScope.USERINFO.email != null}">${sessionScope.USERINFO.email}</c:when>
                                          <c:otherwise>未填写</c:otherwise>
                                        </c:choose>
                                      </a>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <hr/>
                            <div class="resume-form">
                              <form class="noo-ajax-register-form form-horizontal" id="postInfo-form">
                              <div class="resume-form-general row">
                                <div class="col-sm-7">
                                  <div class="form-group">
                                    <label for="title" class="col-sm-5 control-label">简历标题</label>
                                    <div class="col-sm-7">
                                      <input type="text" value="<c:if test="${resume != null}">${resume.title}</c:if>" class="form-control" id="title" name="title" autofocus required>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="highest_degree" class="col-sm-5 control-label">最高学历</label>
                                    <div class="col-sm-7">
                                      <input type="text" value="<c:if test="${resume != null}">${resume.highestDegree}</c:if>" class="form-control"  id="highest_degree"  name="highest_degree" placeholder="如: &quot;研究生学位&quot;">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="experience" class="col-sm-5 control-label">工作经验</label>
                                    <div class="col-sm-7">
                                      <input type="text" value="<c:if test="${resume != null}">${resume.experience}</c:if>" class="form-control"  id="experience"  name="experience" placeholder="如: &quot;1年&quot;, &quot;2年&quot;" >
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label class="col-sm-5 control-label">工作种类</label>
                                    <div class="col-sm-7">
                                      <c:choose>
                                        <c:when test="${resume != null}">
                                          <c:if test="${chosenCategoryList != null}">
                                            <c:forEach items="${chosenCategoryList}" var="cate">
                                              <span>${cate.title}</span>
                                              <a class="search-choice-close" data-option-array-index="${cate.id}"></a>
                                            </c:forEach>
                                          </c:if>
                                        </c:when>
                                        <c:otherwise>
                                          <select id="category" name="category[]" multiple class="form-control form-control-chosen" data-placeholder="选择种类">
                                            <option value="">&nbsp;</option>
                                            <c:forEach items="${categoryList}" var="v">
                                              <option value="${v.id}">${v.title}</option>
                                            </c:forEach>
                                          </select>
                                        </c:otherwise>
                                      </c:choose>
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <label for="city" class="col-sm-5 control-label">工作地点</label>
                                    <div class="col-sm-7">
                                      <c:choose>
                                        <c:when test="${resume != null}">
                                          <c:if test="${chosenCityList != null}">
                                            <c:forEach items="${chosenCityList}" var="city">
                                              <span>${city.name}</span>
                                              <a class="search-choice-close" data-option-array-index="${city.id}"></a>
                                            </c:forEach>
                                          </c:if>
                                        </c:when>
                                        <c:otherwise>
                                          <select id="city" name="city[]" multiple class="form-control form-control-chosen" data-placeholder="选择城市">
                                            <option value="">&nbsp;</option>
                                            <c:forEach items="${cityList}" var="v">
                                              <option value="${v.id}">${v.name}</option>
                                            </c:forEach>
                                          </select>
                                        </c:otherwise>
                                      </c:choose>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-5">
                                  <label for="introduction" class="control-label">自我介绍</label>
                                  <textarea class="form-control" id="introduction" name="introduction" rows="14" placeholder="请简单做下自我介绍"><c:if test="${resume != null}">${resume.introduction}</c:if></textarea>
                                </div>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
                        <div class="form-actions form-group text-center clearfix">
                          <button type="button" class="btn btn-primary" id="postInfo-sub-btn">继续</button>
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

    // 继续
    $("#postInfo-sub-btn").on('click', function(){
      save();
    });

    /**
     * 保存
     * @returns {boolean}
     */
    function save() {
      // 是否是编辑状态
      var isEdit = false;
      var id = 0;
      <c:if test="${resume != null}">
        isEdit = true;
      </c:if>
      // 标题
      var title = $("#title").val();
      // 最高学位
      var highestDegree = $("#highest_degree").val();
      // 工作经验
      var experience = $("#experience").val();
      // 工作种类
      var category = "";
      $( "#category option:selected" ).each(function(i, item) {
        category += (item.value + ",");
      });
      category = category.substring(0, category.length - 1);
      // 工作城市
      var city = "";
      $( "#city option:selected" ).each(function(i, item) {
        city += (item.value + ",");
      });
      city = city.substring(0, city.length - 1);

      // 编辑资料
      <c:if test="${resume != null}">
        category = "${resume.jobCategoryIds}";
        city = "${resume.cityIds}";
        id = ${resume.id};
      </c:if>

      // 自我介绍
      var intro = $("#introduction").val();

      // 数据校验
      if (!isSpecifyLength(title, 1, 20)) {
        toastr.error("标题必须在1~20位");
        return false;
      } else if (isEmpty(highestDegree)) {
        toastr.error("最高学历不能为空");
        return false;
      } else if (isEmpty(experience)){
        toastr.error("工作经验不能为空");
        return false;
      } else if (isEmpty(category)){
        toastr.error("工作种类不能为空");
        return false;
      } else if (isEmpty(city)) {
        toastr.error("工作城市不能为空");
        return false;
      } else if (isEmpty(intro)) {
        toastr.error("自我介绍不能为空");
        return false;
      } else {
      	var postUrl = "<%=basePath%>";
        postUrl += isEdit ? "postInfo/" + id : "postInfo";
        var redirectUrl = "<%=basePath%>";
        redirectUrl += isEdit ? "postDetail/" + id : "postDetail";
        $.ajax({
          url : postUrl,
          data: {
            "title" : title,
            "highestDegree" : highestDegree,
            "experience" : experience,
            "introduction" : intro,
            "jobCategoryIds" : category,
            "cityIds" : city
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              setTimeout(function(){
                window.location.href = redirectUrl;
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