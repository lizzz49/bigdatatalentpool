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
  <jsp:include page="head.jsp" flush="true"></jsp:include>
</head>
<body>
<div class="site">
  <%--头部--%>
  <jsp:include page="header.jsp" flush="true"></jsp:include>
  <%--头部--%>
  <div class="container-wrap">
    <div class="main-content container-fullwidth">
      <div class="row">
        <div class="noo-main col-md-12">
          <div class="row">
            <div class="col-md-12">
              <div class="noo-job-search-wrapper">
                <div class="job-search-bg-image"></div>
                <div class="job-advanced-search column-4">
                  <div class="job-search-info text-center">
                    <p class="search-top-title">大数据人才简历库</p>
                    <h3 class="search-main-title">快加入我们吧</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row bg-primary">
            <div class="col-md-12">
              <div class="noo-step-icon clearfix">
                <ul class="noo-step-icon-3">
                  <li>
                    <span class="noo-step-icon-item">
                      <a href="#">
                        <span class="fa fa-key noo-step-icon-class"></span>
                        <span class="noo-step-icon-title">
                          1.注册一个账户
                        </span>
                      </a>
                    </span>
                  </li>
                  <li>
                    <span class="noo-step-icon-item">
                      <a href="#">
                        <span class="fa fa-search-plus noo-step-icon-class"></span>
                        <span class="noo-step-icon-title">
                          2. 发布简历
                        </span>
                      </a>
                    </span>
                  </li>
                  <li>
                    <span class="noo-step-icon-item">
                      <a href="#">
                        <span class="fa fa-file-text-o noo-step-icon-class"></span>
                        <span class="noo-step-icon-title">
                          3. 看到您的简历
                        </span>
                      </a>
                    </span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="row pt-10 pb-10 bg-white">
            <div class="container-boxed max">
              <div class="col-md-12">
                <div class="noo-tabs">
                  <div class="tab-control tab-control-right clearfix">
                    <ul class="nav nav-tabs" role="tablist" id="noo-tabs-2">
                      <li><a role="tab" data-toggle="tab" href="#tab-1">最新人才</a></li>
                      <li><a role="tab" data-toggle="tab" href="#tab-2">最新简历</a></li>
                    </ul>
                  </div>
                  <div class="tab-content clearfix">
                    <div class="tab-pane" id="tab-1">
                      <div class="jobs posts-loop">
                        <div class="posts-loop-title">
                          <h3>
                            最新 <span class="text-primary">${employeeListCount}</span> 个人才
                          </h3>
                        </div>
                        <div class="posts-loop-content">
                          <c:forEach items="${employeeList}" var="v">
                            <article class="noo_job hentry">
                            <div class="loop-item-wrap">
                              <div class="item-featured">
                                <a href="#">
                                  <img width="222" height="131" src="
                                  <c:choose>
                                    <c:when test="${v.avatar != null and v.avatar != ''}"><%=basePath%>upload/avatar/${v.avatar}</c:when>
                                    <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
                                    </c:choose>
                                  " alt="${v.username}"/>
                                </a>
                              </div>
                              <div class="loop-item-content">
                                <h2 class="loop-item-title">
                                  <a href="#">${v.username}</a>
                                </h2>
                                <p class="content-meta">
                                  <span class="job-company">
                                    <a href="#">${v.email}</a>
                                  </span>
                                  <span class="job-type contract">
                                    <a href="#">
                                      <i class="fa fa-bookmark"></i>
                                      <c:choose>
                                        <c:when test="${v.job != null and v.job != ''}">${v.job}</c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </a>
                                  </span>
                                  <span class="job-location">
                                    <i class="fa fa-map-marker"></i>
                                    <a href="#"><em>
                                      <c:choose>
                                        <c:when test="${v.address != null and v.address != ''}">${v.address}</c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </em></a>
                                  </span>
                                  <span>
                                    <time class="entry-date">
                                      <i class="fa fa-calendar"></i>
                                      <c:choose>
                                        <c:when test="${v.birthday != null and v.birthday != ''}">
                                          <fmt:formatDate value="${v.birthday}" pattern="yyyy-MM-dd"/>
                                        </c:when>
                                        <c:otherwise>未填写</c:otherwise>
                                      </c:choose>
                                    </time>
                                  </span>
                                </p>
                              </div>
                            </div>
                          </article>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="tab-2">
                      <div class="jobs posts-loop jobs-shortcode">
                        <div class="posts-loop-title">
                          <h3>
                            最新 <span class="text-primary">${resumeListCount}</span> 份简历
                          </h3>
                        </div>
                        <div class="posts-loop-content">
                          <c:forEach items="${resumeList}" var="v">
                          <article class="noo_job hentry">
                            <div class="loop-item-wrap">
                              <div class="loop-item-content">
                                <h2 class="loop-item-title">
                                  <a href="#">${v.title}</a>
                                </h2>
                                <p class="content-meta">
                                  <span class="job-company">
                                    <a href="#">${v.highestDegree}</a>
                                  </span>
                                  <span>
                                    <time class="entry-date">
                                      <i class="fa fa-calendar"></i>
                                        ${v.experience}
                                    </time>
                                  </span>
                                  <span class="job-type full-time">
                                    <a href="#">
                                      <i class="fa fa-bookmark"></i>
                                      ${v.introduction}
                                    </a>
                                  </span>
                                </p>
                              </div>
                              <div class="show-view-more">
                                <a class="btn btn-primary" href="<%=basePath%>resume/${v.id}">查看详情</a>
                              </div>
                            </div>
                          </article>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row bg-gray-overlay bg-image bg-parallax pt-10 pb-10">
            <div class="col-md-12 parallax-content">
              <div id="noo-slider-3" class="noo-slider bottom-indicators">
                <ul class="sliders">
                  <c:forEach items="${employeeList}" var="v">
                    <li class="slide-item">
                    <div class="slide-content">
                      <div class="our-customer">
                        <p>
                          <a class="customer-avatar" href="javascript:void(0)">
                            <img src="
                              <c:choose>
                                <c:when test="${v.avatar != null and v.avatar != ''}"><%=basePath%>upload/avatar/${v.avatar}</c:when>
                                <c:otherwise><%=basePath%>job/images/avatar/anonymous.png</c:otherwise>
                              </c:choose>
                            " alt="customer" width="100" height="100"/>
                          </a>
                        </p>
                        <div class="custom-desc">
                          <h5>${v.username}</h5>
                          <p>
                            <c:choose>
                              <c:when test="${v.job != null and v.job != ''}">${v.job}</c:when>
                              <c:otherwise>大数据人才</c:otherwise>
                            </c:choose>
                            <i>
                              <c:choose>
                                <c:when test="${v.description != null and v.description != ''}">${v.description}</c:when>
                                <c:otherwise>这家伙很懒，什么都没留下。</c:otherwise>
                              </c:choose>
                            </i>
                          </p>
                        </div>
                      </div>
                    </div>
                  </li>
                  </c:forEach>
                </ul>
                <div class="clearfix"></div>
                <div id="noo-slider-3-pagination" class="slider-indicators"></div>
              </div>
            </div>
            <div class="parallax customer" data-parallax="1" data-parallax_no_mobile="1" data-velocity="0.1"></div>
          </div>
          <div class="row bg-gray pt-10 pb-10">
            <div class="col-md-12">
              <div class="noo-text-block">
                <h3 class="text-center">大数据人才简历库</h3>
                <p class="text-center text-italic">
                  2016年大数据将走下神坛拥抱生活 <br/> 资本青睐创业机会多
                </p>
              </div>
              <div class="container-boxed max">
                <div class="row pt-5 pb-2">
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-mobile"></i>
                          </span>
                        </span>
                        <strong>数据获取更加困难</strong><br/>
                        数据和知识产权是息息相关的。在2015年间，我们看到了很多通过爬取公共数据来获得盈利的新创企业。比如说爬取社交媒体数据做舆情分析的，爬取网站数据来做分析报告的等等。其实这其中就存在“授权”的问题。我们相信，也大胆的预测，在2016年，防止网站数据爬取将变成一种生意。
                      </p>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-cog"></i>
                          </span>
                        </span>
                        <strong>数据分析基础人才缺口更大</strong><br/>
                        放眼全球，根据WANTED Analytics和福布数据分析斯杂志刚刚公布的2015年数据来看，易安信、IBM、思科、甲骨文在2015年招聘的“大数据”人才最多。
                        就岗位数量而言，需要“大数据”技能的岗位空缺呈现高速增长，其中“大数据”解决方案的销售人员、计算机系统分析师、管理分析师、IT项目经理、和信息安全分析师岗位的增幅都在100%以上。
                      </p>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-star"></i>
                          </span>
                        </span>
                        <strong>资本更加青睐大数据</strong><br/>
                        2015年，大数据产业在国家和资本的推动下进入了全面爆发，2015年宣称自己是大数据企业的大概有将近400家，其中典型的大数据企业有200多家。拿到融资的大概有五十多家，整体融资额超过50亿元，其中拿到亿元融资以上的企业有17家，最高融资额为7以人民币，估值超过三十亿元人民币的有十家以上，初创一年之内的大数据企业的起始估值大概在10亿元人民币左右。
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="container-boxed max">
                <div class="row pt-2 pb-2">
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-magic"></i>
                          </span>
                        </span>
                        <strong>数据安全、数据交易等相关法规会逐渐出台</strong><br/>
                        一如网络游戏一样，网络游戏在中国发展近10年之久，到2007年4月15日，国家才出台了针对未成年人的“防沉迷系统”。国家对大数据的重视程度远远超于网络游戏。我们相信，在2016年，中国关于大数据方面的法律法规会逐渐出台，并且下达到各个单位。关于数据知识产权的保护只会越来越多。
                      </p>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-code"></i>
                          </span>
                        </span>
                        <strong>新创企业会越来越多</strong><br/>
                        未来所有的企业都是大数据企业，所有的企业都会重视大数据。而新创的大数据项目将更加注重与生活、人文和文化的结合。未来在所有企业里，大数据都是基础设施，大数据的应用场景将和商业模式融合在一起。
                      </p>
                    </div>
                  </div>
                  <div class="col-md-4 col-sm-6">
                    <div class="noo-text-block">
                      <p>
                        <span class="text-primary pr-2">
                          <span class="noo-icon features-icon icon-circle">
                            <i class="fa fa-thumbs-o-up"></i>
                          </span>
                        </span>
                        <strong>政府将会开放更多的数据</strong><br/>
                        政府数据源一直都是大数据公司最想要的数据。因有棱镜门的前车之鉴，政府数据是不会一下子全部开放的，只能说是一部分一部分的开放。
                      </p>
                    </div>
                  </div>
                </div>
              </div>
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
    $('#noo-slider-3 .sliders').carouFredSel({
      infinite: true,
      circular: true,
      responsive: true,
      debug : false,
      items: {
        start: 0
      },
      scroll: {
        items: 1,
        duration: 400,

        fx: "scroll"
      },
      auto: {
        timeoutDuration: 3000,

        play: true
      },

      pagination: {
        container: "#noo-slider-3-pagination"
      },
      swipe: {
        onTouch: true,
        onMouse: true
      }
    });
    $('#noo-tabs-2 a:eq(0)').tab('show');
  });
</script>
<jsp:include page="modal.jsp" flush="true"></jsp:include>
</body>
</html>