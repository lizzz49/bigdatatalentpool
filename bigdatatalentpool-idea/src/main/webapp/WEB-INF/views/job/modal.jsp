<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="memberModalLogin modal fade" id="userloginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-member">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">登录</h4>
            </div>
            <div class="modal-body">
                <form class="noo-ajax-login-form form-horizontal" id="login-form">
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" class="log form-control" name="username" required placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="pwd form-control" required value="" name="password" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">我要</label>
                        <div class="col-sm-9">
                            <div class="form-control-flat">
                                <select class="user_role" name="role" required>
                                    <option value="0">请选择</option>
                                    <option value="1">找人才</option>
                                    <option value="2">发简历</option>
                                </select>
                                <i class="fa fa-caret-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions form-group text-center">
                        <button type="button" class="btn btn-primary" id="login-btn">登录</button>
                        <div class="login-form-links">
                            <span>
                                还没有账户?
                                <a href="#" class="member-register-link" data-rel="registerModal">
                                    免费注册 <i class="fa fa-long-arrow-right"></i>
                                </a>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="memberModalRegister modal fade" id="userregisterModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-member">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">注 册</h4>
            </div>
            <div class="modal-body">
                <form class="noo-ajax-register-form form-horizontal" id="reg-form">
                    <div class="form-group row user_login_container">
                        <label class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-9">
                            <input type="text" class="user_login form-control" name="username" required placeholder="用户名,5~12位">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-9">
                            <input type="email" class="user_email form-control" name="email" required placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="user_password form-control" required value="" name="password" placeholder="密码,6~20位">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">确认密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="cuser_password form-control" required value="" name="repassword" placeholder="请确认密码">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">我要</label>
                        <div class="col-sm-9">
                            <div class="form-control-flat">
                                <select class="user_role" name="role" required>
                                    <option value="0">请选择</option>
                                    <option value="1">找人才</option>
                                    <option value="2">发简历</option>
                                </select>
                                <i class="fa fa-caret-down"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <button type="button" class="btn btn-primary" id="reg-btn">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
jQuery('document').ready(function ($) {

    // 注册
    $("#reg-btn").on('click', function(){
        register();
    });

    // 登录
    $("#login-btn").on('click', function () {
       login();
    });

    /**
     * 注册
     * @returns {boolean}
     */
    function register() {
        // 用户名
        var username = $("#reg-form input[name=username]").val();
        // 密码
        var password = $("#reg-form input[name=password]").val();
        // 再次输入密码
        var repassword = $("#reg-form input[name=repassword]").val();
        // 邮箱
        var email = $("#reg-form input[name=email]").val();
        // 类型
        var role = $("#reg-form option:selected").val();
        // 是否选中
        var checked = $("#reg-form input[type='checkbox']").is(':checked');

        // 数据校验
        if (!isSpecifyLength(username, 5, 12)) {
            toastr.error("用户名必须在5~12位");
            return false;
        } else if (!isEmail(email)) {
            toastr.error("邮箱格式不正确");
            return false;
        } else if (!isSpecifyLength(password, 6, 20)) {
            toastr.error("密码必须在6~20位");
            return false;
        } else if (password != repassword) {
            toastr.error("两次密码不一致");
            return false;
        } else if (role == 0) {
            toastr.error("请选择类型");
            return false;
        } else {
            var postUrl = "<%=basePath%>";
            postUrl += role == 1 ? "regEmployer" : "regEmployee";

            $.ajax({
                url : postUrl,
                data: $("#reg-form").serialize(),
                method : "post",
                dataType : "json",
                success : function(data) {
                    if (data.status == 'SUCCESS') {
                        toastr.success(data.info);
                        setTimeout(function(){
                            $("#userregisterModal").modal('hide');
                        }, 1000);
                        $("#userloginModal").modal('show');
                    } else {
                        toastr.error(data.info);
                        return false;
                    }
                }
            });
        }
    }

    /**
     * 登录
     * @returns {boolean}
     */
    function login(){
        // 用户名
        var username = $("#login-form input[name=username]").val();
        // 密码
        var password = $("#login-form input[name=password]").val();
        // 类型
        var role = $("#login-form option:selected").val();

        // 数据校验
        if (role == 0) {
            toastr.error("请选择类型");
            return false;
        } else {
        	var postUrl = "<%=basePath%>";
            postUrl += role == 1 ? "loginEmployer" : "loginEmployee";

            $.ajax({
                url : postUrl,
                data: $("#login-form").serialize(),
                method : "post",
                dataType : "json",
                success : function(data) {
                    if (data.status == 'SUCCESS') {
                        toastr.success(data.info);
                        setTimeout(function(){
                            $("#userloginModal").modal('hide');
                            location.reload(true);
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
});

</script>