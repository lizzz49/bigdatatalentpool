<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="row">
  <div class="noo-main col-md-12">
    <div class="member-manage">
      <h3>共${pager.totalCount}条记录&nbsp;${pager.page}/${pager.totalPageNum}</h3>
      <form>
        <div class="member-manage-table">
          <table class="table">
            <thead>
            <tr>
              <th>标题</th>
              <th>最高学历</th>
              <th>经验</th>
              <th>介绍</th>
              <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${resumeList}" var="v">
              <tr>
                <td>
                  <c:choose>
                    <c:when test="${v.title != null and v.title != ''}">${v.title}</c:when>
                    <c:otherwise>未填写</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${v.highestDegree != null and v.highestDegree != ''}">${v.highestDegree}</c:when>
                    <c:otherwise>未填写</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${v.experience != null and v.experience != ''}">${v.experience}</c:when>
                    <c:otherwise>未填写</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${v.introduction != null and v.introduction != ''}">${v.introduction}</c:when>
                    <c:otherwise>未填写</c:otherwise>
                  </c:choose>
                </td>
                <td><a href="<%=basePath%>resume/${v.id}">查看详情</a></td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="member-manage-toolbar bottom-toolbar clearfix">
          <div class="member-manage-page pull-right"></div>
        </div>
        <input type="hidden" id="page" name="page" value="${pager.page}"/>
        <%--分页页码--%>
        <div class="pagination list-center">
          <c:if test="${pager.page - 2 gt 2}">
            <a class="next page-numbers page-click" href="javascript:void(0);" page="${pager.page - 1}">
              <i class="fa fa-long-arrow-left"></i>
            </a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="1">1</a>
            <a class="page-numbers page-click" href="javascript:void(0);" >...</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page - 2}">${pager.page - 2}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page - 1}">${pager.page - 1}</a>
          </c:if>

          <c:if test="${pager.page == 4}">
            <a class="page-numbers page-click" href="javascript:void(0);" page="1">1</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page - 2}">${pager.page - 2}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page - 1}">${pager.page - 1}</a>
          </c:if>

          <c:if test="${pager.page - 2 lt 2}">
            <c:if test="${pager.page == 3}">
              <a class="page-numbers page-click" href="javascript:void(0);" page="1">1</a>
              <a class="page-numbers page-click" href="javascript:void(0);" page="2">2</a>
            </c:if>
            <c:if test="${pager.page == 2}">
              <a class="page-numbers page-click" href="javascript:void(0);" page="1">1</a>
            </c:if>
          </c:if>
          <%--当前页码--%>
          <span class="page-numbers page-click current">${pager.page}</span>
          <%--当前页码--%>

          <c:if test="${pager.page + 3 lt pager.totalPageNum}">
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 1}">${pager.page + 1}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 2}">${pager.page + 2}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" >...</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.totalPageNum}">${pager.totalPageNum}</a>
            <a class="next page-numbers page-click" href="javascript:void(0);" page="${pager.page + 1}">
              <i class="fa fa-long-arrow-right"></i>
            </a>
          </c:if>

          <c:if test="${pager.page + 3 == pager.totalPageNum}">
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 1}">${pager.page + 1}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 2}">${pager.page + 2}</a>
            <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 3}">${pager.page + 3}</a>
          </c:if>

          <c:if test="${pager.page + 3 gt pager.totalPageNum}">
            <c:if test="${pager.page == pager.totalPageNum -1}">
              <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 1}">${pager.page + 1}</a>
            </c:if>
            <c:if test="${pager.page == pager.totalPageNum -2}">
              <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 1}">${pager.page + 1}</a>
              <a class="page-numbers page-click" href="javascript:void(0);" page="${pager.page + 2}">${pager.page + 2}</a>
            </c:if>
          </c:if>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  jQuery('document').ready(function ($) {

    // 跳转分页
    $(".page-click").on('click', function () {
      var page = $(this).attr('page');
      $("#page").val(page);
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