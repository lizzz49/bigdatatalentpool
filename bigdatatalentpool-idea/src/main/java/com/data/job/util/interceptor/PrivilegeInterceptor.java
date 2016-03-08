package com.data.job.util.interceptor;

import com.data.job.util.Constant;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 10:16 AM.
 */
public class PrivilegeInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        HttpSession session = request.getSession();
        /**
         * 页面权限控制
         * 包括：
         * postInfo
         * postDetail
         * postPreview
         * account
         * accountEdit
         */
        if (url.contains("/post")) {
            // 没有登录
            if (null == session.getAttribute(Constant.USERINFO)) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                if (null == session.getAttribute(Constant.CURRENT_RESUME)) {
                    // 1.发布简历详情之前必须发布基本简历的基本信息
                    if (url.equals("/postDetail")) {
                        response.sendRedirect(request.getContextPath() + "/postInfo");
                    } else if (url.equals("/postPreview")) {
                        // 2.预览之前必须经过简历详细步骤
                        if (null == session.getAttribute(Constant.ADD_EDUCATION_DONE)
                                && null == session.getAttribute(Constant.ADD_EXPERIENCE_DONE)
                                && null == session.getAttribute(Constant.ADD_SKILL_DONE)) {
                            response.sendRedirect(request.getContextPath() + "/postInfo");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/postDetail");
                        }
                    }
                }
            }
        } else if (url.contains("/user")) {//用户控制器中所有方法均需要登录之后操作
            if (null == session.getAttribute(Constant.USERINFO)) {
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse
            httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse
            httpServletResponse, Object handler, Exception e) throws Exception {

    }
}
