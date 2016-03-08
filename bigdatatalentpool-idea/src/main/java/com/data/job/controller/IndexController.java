package com.data.job.controller;

import com.data.job.domain.Employee;
import com.data.job.domain.Resume;
import com.data.job.service.EmployeeService;
import com.data.job.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * 首页控制器
 * 包括首页显示、404、500页面
 *
 * @author tyee.noprom@qq.com
 * Created by noprom on 2/4/16.
 */
@Controller
public class IndexController {

    // 静态资源前缀
    public static final String STATIC_PREFIX = "job";

    // 自动加载 EmployeeService
    @Autowired
    private EmployeeService employeeService;

    // 自动加载 ResumeService
    @Autowired
    private ResumeService resumeService;

    /**
     * 首页显示页面
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        List<Resume> resumeList = resumeService.getAResumeList(5);
        List<Employee> employeeList = employeeService.getAEmployeeList(5);

        model.addAttribute("url", "/");
        model.addAttribute("resumeListCount", resumeList.size());
        model.addAttribute("resumeList", resumeList);
        model.addAttribute("employeeListCount", employeeList.size());
        model.addAttribute("employeeList", employeeList);
        return STATIC_PREFIX + "/index";
    }

    /**
     * 404页面配置
     *
     * @return 视图
     */
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String fourZero() {
        return STATIC_PREFIX + "/404";
    }

    /**
     * 500页面配置
     *
     * @return 视图
     */
    @RequestMapping(value = "/500", method = RequestMethod.GET)
    public String fiveZero() {
        return STATIC_PREFIX + "/500";
    }
}
