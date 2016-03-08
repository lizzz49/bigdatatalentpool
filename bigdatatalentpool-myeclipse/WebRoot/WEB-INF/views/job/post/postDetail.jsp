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
          简历详情
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
                      <li class="completed">
                        <span class="jstep-num">
                          <a href="javascript:void(0);"><i class="fa fa-check"></i></a>
                        </span>
                        <div class="jstep-line">
                          <span class="jstep-dot"></span>
                        </div>
                        <div class="jstep-label">基本信息</div>
                      </li>
                      <li class="active">
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
                  <form class="form-horizontal" method="post">
                    <div class="jstep-content">
                      <div class="jpanel jpanel-resume-form">
                        <div class="jpanel-title">
                          <h3>简历详情</h3>
                        </div>
                        <div class="jpanel-body">
                          <div class="resume-form">
                            <div class="resume-form-detail">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">教育信息</label>
                                <div class="col-sm-9">
                                  <c:choose>
                                    <c:when test="${educationList == null}">
                                      <div class="noo-metabox-addable">
                                        <div class="noo-addable-fields">
                                          <div class="fields-group">
                                            <input type="text" class="form-control" placeholder="学校名称" name='school' value="" id="education_school"/>
                                            <input type="text" class="form-control" placeholder="资质" name='qualification' value="" id="education_qualification"/>
                                            <input type="text" class="form-control" placeholder="开始/结束 时间" name='date' value="" id="education_date"/>
                                            <textarea class="form-control form-control-editor ignore-valid" id="education_note" name="note" rows="5" placeholder="备注"></textarea>
                                          </div>
                                        </div>
                                        <div class="noo-addable-actions">
                                          <a href="javascript:void(0);" class="noo-clone-fields pull-left" id="add-edu-btn">
                                            <i class="fa fa-plus-circle text-primary"></i>
                                            确认增加
                                          </a>
                                        </div>
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <c:forEach items="${educationList}" var="v">
                                        <div class="noo-metabox-addable">
                                          <div class="noo-addable-fields">
                                            <div class="fields-group">
                                              <input type="text" class="form-control" placeholder="学校名称" name='school' value="${v.school}" id="education_school_${v.id}"/>
                                              <input type="text" class="form-control" placeholder="资质" name='qualification' value="${v.qualification}" id="education_qualification_${v.id}"/>
                                              <input type="text" class="form-control" placeholder="开始/结束 时间" name='date' value="${v.date}" id="education_date_${v.id}"/>
                                              <textarea class="form-control form-control-editor ignore-valid" id="education_note_${v.id}" name="note" rows="5" placeholder="备注">${v.note}</textarea>
                                            </div>
                                          </div>
                                          <div class="noo-addable-actions">
                                            <a href="javascript:void(0);" class="noo-clone-fields pull-left edit-edu-btn" key="${v.id}">
                                              <i class="fa fa-plus-circle text-primary"></i>
                                              确认修改
                                            </a>
                                          </div>
                                        </div>
                                      </c:forEach>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">工作经历</label>
                                <div class="col-sm-9">
                                  <c:choose>
                                  <c:when test="${experienceList == null}">
                                  <div class="noo-metabox-addable">
                                    <div class="noo-addable-fields">
                                      <div class="fields-group">
                                        <input type="text" class="form-control" placeholder="数据分析师" name='title' value="" id="experience_title" />
                                        <input type="text" class="form-control" placeholder="开始/结束 时间" name='date' value="" id="experience_date" />
                                        <textarea class="form-control" id="experience_note" name="note" rows="5" placeholder="备注"></textarea>
                                      </div>
                                    </div>
                                    <div class="noo-addable-actions">
                                      <a href="javascript:void(0);" class="noo-clone-fields pull-left" id="add-exp-btn">
                                        <i class="fa fa-plus-circle text-primary"></i>
                                        确认增加
                                      </a>
                                    </div>
                                  </div>
                                  </c:when>
                                    <c:otherwise>
                                    <c:forEach items="${experienceList}" var="v">
                                      <div class="noo-metabox-addable">
                                        <div class="noo-addable-fields">
                                          <div class="fields-group">
                                            <input type="text" class="form-control" placeholder="数据分析师" name='title' value="${v.title}" id="experience_title_${v.id}" />
                                            <input type="text" class="form-control" placeholder="开始/结束 时间" name='date' value="${v.date}" id="experience_date_${v.id}" />
                                            <textarea class="form-control" id="experience_note_${v.id}" name="note" rows="5" placeholder="备注">${v.note}</textarea>
                                          </div>
                                        </div>
                                        <div class="noo-addable-actions">
                                          <a href="javascript:void(0);" class="noo-clone-fields pull-left edit-exp-btn" key="${v.id}">
                                            <i class="fa fa-plus-circle text-primary"></i>
                                            确认修改
                                          </a>
                                        </div>
                                      </div>
                                    </c:forEach>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">掌握技能</label>
                                <div class="col-sm-9">
                                  <c:choose>
                                  <c:when test="${skillList == null}">
                                  <div class="noo-metabox-addable">
                                    <div class="noo-addable-fields">
                                      <div class="fields-group row">
                                        <div class="col-sm-9 col-xs-6">
                                          <input type="text" class="form-control" placeholder="技能名称" name='name' value="" id="skill_name" />
                                        </div>
                                        <div class="col-sm-3 col-xs-6">
                                          <input type="text" class="form-control" name='percent' value="" id="skill_percent" />
                                          <span class="percent-text">% (1 to 100)</span>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="noo-addable-actions">
                                      <a href="javascript:void(0);" class="noo-clone-fields pull-left" id="add-skill-btn">
                                        <i class="fa fa-plus-circle text-primary"></i>
                                        确认增加
                                      </a>
                                    </div>
                                  </div>
                                  </c:when>
                                    <c:otherwise>
                                    <c:forEach items="${skillList}" var="v">
                                      <div class="noo-metabox-addable">
                                        <div class="noo-addable-fields row">
                                          <div class="fields-group ">
                                            <div class="col-sm-9 col-xs-6">
                                              <input type="text" class="form-control" placeholder="技能名称" name='name' value="${v.name}" id="skill_name_${v.id}" />
                                            </div>
                                            <div class="col-sm-3 col-xs-6">
                                              <input type="text" class="form-control" name='percent' value="${v.percent}" id="skill_percent_${v.id}" />
                                              <span class="percent-text">% (1 to 100)</span>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="noo-addable-actions row" style="padding-left: 15px;">
                                          <a href="javascript:void(0);" class="noo-clone-fields pull-left edit-skill-btn" key="${v.id}">
                                            <i class="fa fa-plus-circle text-primary"></i>
                                            确认修改
                                          </a>
                                        </div>
                                      </div>
                                    </c:forEach>
                                    </c:otherwise>
                                  </c:choose>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-actions form-group text-center clearfix">
                        <c:choose>
                          <c:when test="${resume != null}">
                            <a class="btn btn-primary" href="<%=basePath%>postInfo/${resume.id}">返回</a>
                            <a class="btn btn-primary" href="<%=basePath%>postPreview/${resume.id}">预览</a>
                          </c:when>
                          <c:otherwise>
                            <a class="btn btn-primary" href="<%=basePath%>postInfo">返回</a>
                            <button type="button" class="btn btn-primary" id="preview-btn">预览</button>
                          </c:otherwise>
                        </c:choose>
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

    var click_edu = false;
    var click_exp = false;
    var click_skill = false;

    // 时间选择框
    $(".jform-datepicker").datetimepicker({format:"YYYY-M-dd"});

    // 增加教育信息
    $("#add-edu-btn").on('click', function(){
      addEducation();
    });

    // 增加工作经历
    $("#add-exp-btn").on('click', function () {
      addExperience();
    });

    // 增加技能
    $("#add-skill-btn").on('click', function () {
      addSkill();
    });

    // 预览
    $("#preview-btn").on('click', function () {
      preview();
    });

    /**
     * 新增教育信息
     * @returns {boolean}
     */
    function addEducation() {
      // 学校
      var school = $("#education_school").val();
      // 资质
      var qualification = $("#education_qualification").val();
      // 开始结束时间
      var date = $("#education_date").val();
      // 备注
      var note = $("#education_note").val();

      // 数据校验
      if (isEmpty(school)) {
        toastr.error("学校不能为空");
        return false;
      } else if (isEmpty(qualification)) {
        toastr.error("资历不能为空");
        return false;
      } else if (isEmpty(date)){
        toastr.error("开始结束时间不能为空");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>addEducation",
          data: {
            "school" : school,
            "qualification" : qualification,
            "date" : date,
            "note" : note
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              click_edu = true;
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
    }

    /**
     * 新增工作经历
     * @returns {boolean}
     */
    function addExperience() {
      // 称呼
      var title = $("#experience_title").val();
      // 开始结束时间
      var date = $("#experience_date").val();
      // 备注
      var note = $("#experience_note").val();

      // 数据校验
      if (isEmpty(title)) {
        toastr.error("称呼不能为空");
        return false;
      } else if (isEmpty(date)){
        toastr.error("开始结束时间不能为空");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>addExperience",
          data: {
            "title" : title,
            "date" : date,
            "note" : note
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              click_exp = true;
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
    }

    /**
     * 新增技能
     * @returns {boolean}
     */
    function addSkill() {
      // 技能名
      var name = $("#skill_name").val();
      // 技能百分比
      var percent = $("#skill_percent").val();

      // 数据校验
      if (isEmpty(name)) {
        toastr.error("技能不能为空");
        return false;
      } else if (isEmpty(percent)) {
        toastr.error("百分比不能为空");
        return false;
      } else if (percent < 0 || percent > 100) {
        toastr.error("百分比取值不正确");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>addSkill",
          data: {
            "name" : name,
            "percent" : percent
          },
          method : "post",
          dataType : "json",
          success : function(data) {
            if (data.status == 'SUCCESS') {
              toastr.success(data.info);
              click_skill = true;
            } else {
              toastr.error(data.info);
              return false;
            }
          }
        });
      }
    }

    /**
     * 预览
     */
    function preview() {
      if (click_edu == false || click_exp == false || click_skill == false) {
        toastr.error("请完善简历信息");
        return false;
      }
      window.location.href = bathPath + "postPreview";
    }

    // 编辑教育信息
    $(".edit-edu-btn").on('click', function(){
      var key = $(this).attr('key');
      // 学校
      var school = $("#education_school_" + key).val();
      // 资质
      var qualification = $("#education_qualification_" + key).val();
      // 开始结束时间
      var date = $("#education_date_" + key).val();
      // 备注
      var note = $("#education_note_" + key).val();

      // 数据校验
      if (isEmpty(school)) {
        toastr.error("学校不能为空");
        return false;
      } else if (isEmpty(qualification)) {
        toastr.error("资历不能为空");
        return false;
      } else if (isEmpty(date)){
        toastr.error("开始结束时间不能为空");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>editEducation",
          data: {
            "id" : key,
            "school" : school,
            "qualification" : qualification,
            "date" : date,
            "note" : note
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
      }
    });

    // 编辑工作经历
    $(".edit-exp-btn").on('click', function () {
      var key = $(this).attr('key');
      // 称呼
      var title = $("#experience_title_" + key).val();
      // 开始结束时间
      var date = $("#experience_date_" + key).val();
      // 备注
      var note = $("#experience_note_" + key).val();

      // 数据校验
      if (isEmpty(title)) {
        toastr.error("称呼不能为空");
        return false;
      } else if (isEmpty(date)){
        toastr.error("开始结束时间不能为空");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>editExperience",
          data: {
            "id" : key,
            "title" : title,
            "date" : date,
            "note" : note
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
      }
    });

    // 编辑技能
    $(".edit-skill-btn").on('click', function(){
      var key = $(this).attr('key');
      // 技能名
      var name = $("#skill_name_" + key).val();
      // 技能百分比
      var percent = $("#skill_percent_" + key).val();

      // 数据校验
      if (isEmpty(name)) {
        toastr.error("技能不能为空");
        return false;
      } else if (isEmpty(percent)) {
        toastr.error("百分比不能为空");
        return false;
      } else if (percent < 0 || percent > 100) {
        toastr.error("百分比取值不正确");
        return false;
      } else {
        $.ajax({
          url : "<%=basePath%>editSkill",
          data: {
            "id" : key,
            "name" : name,
            "percent" : percent
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