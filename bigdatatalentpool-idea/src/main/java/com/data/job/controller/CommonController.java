package com.data.job.controller;

import com.data.job.domain.Employee;
import com.data.job.domain.Employer;
import com.data.job.service.EmployeeService;
import com.data.job.service.EmployerService;
import com.data.job.util.Constant;
import com.data.job.util.MD5;
import com.data.job.util.Result;
import com.data.job.util.config.CompositeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 公共控制器
 * 包括用户的登录、注册、退出登录等
 *
 * @author tyee.noprom@qq.com
 * @time 2/11/16 2:52 PM.
 */
@Controller
public class CommonController {

    // 静态资源前缀
    public static final String STATIC_PREFIX = "job";

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private EmployerService employerService;

    /**
     * 登录页面
     *
     * @param model model
     * @return 登陆页视图
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin(Model model) {
        return STATIC_PREFIX + "/login";
    }

    /**
     * 退出登录
     *
     * @param session session
     * @param request request
     * @param response response
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        session.setAttribute(Constant.USERINFO, null);
        session.setAttribute(Constant.LOGIN_TYPE, null);
        response.sendRedirect(request.getContextPath() + "/");
        return null;
    }

    /**
     * 注册Employee
     *
     * @param employee employee
     * @return 1 or 0
     */
    @RequestMapping(value = "/regEmployee", method = RequestMethod.POST)
    public @ResponseBody
    Result regEmployee(Employee employee) {
        // 查找是否存在相同用户名的Employee
        Employee old = employeeService.getEmployeeByUsername(employee.getUsername());
        if (old != null) {
            return new Result(Result.Status.ERROR, Constant.USERNAME_EXISTS);
        }

        // 密码MD5加密
        String encStr = employee.getUsername() + Constant.MD5_HASH + employee.getPassword();
        employee.setPassword(MD5.digest(encStr));
        Integer id = employeeService.addEmployee(employee);
        if (id > 0) {
            return new Result(Result.Status.SUCCESS, Constant.REG_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.REG_FAIL);
        }
    }

    /**
     * 注册Employer
     *
     * @param employer employer
     * @return 1 or 0
     */
    @RequestMapping(value = "/regEmployer", method = RequestMethod.POST)
    public @ResponseBody
    Result regEmployer(Employer employer) {
        // 查找是否存在相同用户名的Employer
        Employer old = employerService.getEmployerByUsername(employer.getUsername());
        if (old != null) {
            return new Result(Result.Status.ERROR, Constant.USERNAME_EXISTS);
        }

        // 密码MD5加密
        String encStr = employer.getUsername() + Constant.MD5_HASH + employer.getPassword();
        employer.setPassword(MD5.digest(encStr));
        Integer id = employerService.addEmployer(employer);
        if (id > 0) {
            return new Result(Result.Status.SUCCESS, Constant.REG_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.REG_FAIL);
        }
    }

    /**
     * Employee登录
     *
     * @param employee 应聘者
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/loginEmployee", method = RequestMethod.POST)
    public @ResponseBody
    Result loginEmployee(Employee employee, HttpSession session) {
        // 密码MD5加密
        String encStr = employee.getUsername() + Constant.MD5_HASH + employee.getPassword();
        employee.setPassword(MD5.digest(encStr));
        Employee loginEmployee = employeeService.loginEmployee(employee);
        if (loginEmployee != null) {
            // 存放用户信息在session中 有效时间60分钟
            session.setAttribute(Constant.USERINFO, loginEmployee);
            session.setAttribute(Constant.LOGIN_TYPE, "Employee");
            String sessionTime = CompositeFactory.getInstance().getString(Constant.SESSION_INVALID_TIME);
            session.setMaxInactiveInterval(Integer.parseInt(sessionTime));
            return new Result(Result.Status.SUCCESS, Constant.LOGIN_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.LOGIN_FAIL);
        }
    }

    /**
     * Employer登录
     *
     * @param employer 招人者
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/loginEmployer", method = RequestMethod.POST)
    public @ResponseBody
    Result loginEmployer(Employer employer, HttpSession session) {
        // 密码MD5加密
        String encStr = employer.getUsername() + Constant.MD5_HASH + employer.getPassword();
        employer.setPassword(MD5.digest(encStr));
        Employer loginEmployer = employerService.loginEmployer(employer);
        if (loginEmployer != null) {
            // 存放用户信息在session中 有效时间60分钟
            session.setAttribute(Constant.USERINFO, loginEmployer);
            session.setAttribute(Constant.LOGIN_TYPE, "Employer");
            String sessionTime = CompositeFactory.getInstance().getString(Constant.SESSION_INVALID_TIME);
            session.setMaxInactiveInterval(Integer.parseInt(sessionTime));
            return new Result(Result.Status.SUCCESS, Constant.LOGIN_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.LOGIN_FAIL);
        }
    }

}
