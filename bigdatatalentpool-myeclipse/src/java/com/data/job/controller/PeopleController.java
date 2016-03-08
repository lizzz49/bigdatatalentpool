package com.data.job.controller;

import com.data.job.domain.Employee;
import com.data.job.service.EmployeeService;
import com.data.job.util.BeanUtil;
import com.data.job.util.Constant;
import com.data.job.util.JsonUtil;
import com.data.job.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

/**
 * 人才页面控制器
 * 包括：
 * 1.人才列表
 * 2.加载人才列表
 *
 * @author tyee.noprom@qq.com
 * @time 2/12/16 1:43 PM.
 */
@Controller
public class PeopleController {

    // 静态资源前缀
    public static final String STATIC_PREFIX = "job/people";

    // 自动加载 EmployeeService
    @Autowired
    private EmployeeService employeeService;

    /**
     * 人才列表
     *
     * @param session session
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/people", method = RequestMethod.GET)
    public String people(HttpSession session, Model model) {
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        if (loginType != null) {
            model.addAttribute("loginType", loginType);
        }
        model.addAttribute("url", "/people");
        return STATIC_PREFIX + "/people";
    }

    /**
     * 加载人才列表
     *
     * @param model model
     * @param param 查询参数
     * @param pager 分页类
     * @return 人才列表
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/loadPeople", method = RequestMethod.GET)
    public String loadPeople(Model model, String param, Pager<Employee> pager) throws Exception {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        Employee employee = JsonUtil.fromJson(param, Employee.class);
        // 解码处理
        BeanUtil.decodeBean(employee);
        paramMap.put("employee", employee);
        List<Employee> employeeList = employeeService.getEmployeeList(paramMap, pager);
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("pager", pager);
        return STATIC_PREFIX + "/peopleList";
    }
}