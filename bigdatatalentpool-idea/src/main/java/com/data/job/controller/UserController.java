package com.data.job.controller;

import com.data.job.domain.*;
import com.data.job.service.*;
import com.data.job.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 网站用户的管理控制器
 * 该控制器下面的所有操作均需要以后才能使用
 * 包括以下功能:
 * 1.我的账户页面
 * 2.账户管理页面
 * 3.我的简历列表
 * 4.某一个简历详情
 * 5.上传用户头像
 * 6.更新用户资料
 * 7.修改密码
 * 8.根据简历id删除简历
 * 9.更新简历的状态
 *
 * @author tyee.noprom@qq.com
 * Created by noprom on 2/4/16.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    // 静态资源前缀
    public static final String STATIC_PREFIX = "job/user";

    // 自动加载EmployeeService
    @Autowired
    private EmployeeService employeeService;

    // 自动加载ResumeService
    @Autowired
    private ResumeService resumeService;

    // 自动加载CategoryService
    @Autowired
    private CategoryService categoryService;

    // 自动加载CityService
    @Autowired
    private CityService cityService;

    // 自动加载EducationService
    @Autowired
    private EducationService educationService;

    // 自动加载ExperienceService
    @Autowired
    private ExperienceService experienceService;

    // 自动加载SkillService
    @Autowired
    private SkillService skillService;

    /**
     * 我的账户页面
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping
    public String index(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            model.addAttribute(Constant.USERINFO, employee);
        }
        return STATIC_PREFIX + "/index";
    }

    /**
     * 账户管理页面
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public String account(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            model.addAttribute(Constant.USERINFO, employee);
        }
        return STATIC_PREFIX + "/account";
    }

    /**
     * 我的简历列表
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/resume", method = RequestMethod.GET)
    public String resumeList(Model model, HttpSession session, HttpServletRequest request) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            List<Resume> resumeList = resumeService.getResumeListByUserId(employee.getId(), null);
            model.addAttribute(Constant.RESUME_COUNT, resumeList.size());
            model.addAttribute(Constant.RESUME_LIST, resumeList);
        }
        return STATIC_PREFIX + "/resume";
    }

    /**
     * 某一个简历详情
     *
     * @param id 简历id
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/resume/{id}", method = RequestMethod.GET)
    public String resumeDetail(@PathVariable("id") Integer id, Model model) {
        Resume resume = resumeService.getResumeById(id);
        System.out.println(resume);
        if (resume != null) {
            // 基本简历信息
            String[] categoryIds = resume.getJobCategoryIds().split(",");
            String[] cityIds = resume.getCityIds().split(",");
            // 基本简历包含的工作种类
            List<Category> categoryList = new ArrayList<Category>();
            for(String cateId : categoryIds) {
                Category category = new Category();
                category = categoryService.getCategoryById(Integer.parseInt(cateId));
                if (category != null) {
                    categoryList.add(category);
                }
            }
            // 基本简历包含的城市列表
            List<City> cityList = new ArrayList<City>();
            for (String cityId : cityIds) {
                City city = new City();
                city = cityService.getCityById(Integer.parseInt(cityId));
                if (city != null) {
                    cityList.add(city);
                }
            }
            // 填充基本简历信息
            BasicResume basicResume = new BasicResume();
            basicResume.setResume(resume);
            basicResume.setCityList(cityList);
            basicResume.setCategoryList(categoryList);

            // 获得工作经历列表
            List<Experience> experienceList = experienceService.getExperienceList(resume.getId());
            // 获得教育信息列表
            List<Education> educationList = educationService.getEducationList(resume.getId());
            // 获得技能列表
            List<Skill> skillList = skillService.getSkillList(resume.getId());

            // 在视图上显示
            model.addAttribute(Constant.BASIC_RESUME, basicResume);
            model.addAttribute(Constant.EXPERIENCE_LIST, experienceList);
            model.addAttribute(Constant.EDUCATION_LIST, educationList);
            model.addAttribute(Constant.SKILL_LIST, skillList);
            model.addAttribute(Constant.CURRENT_RESUME, resume);
        }
        return STATIC_PREFIX + "/resumeDetail";
    }

    /**
     * 上传用户头像
     *
     * @param file 头像
     * @param session session
     * @param request request
     * @param response response
     * @return success or fail
     */
    @RequestMapping(value = "/uploadAvatar", method = RequestMethod.POST)
    public @ResponseBody
    Result uploadAvatar(@RequestParam("file") MultipartFile file, HttpSession session,
                               HttpServletRequest request, HttpServletResponse response) {
        FileUploader uploader = new FileUploader();
        try {
            boolean success = uploader.upload(file, "/upload/avatar", request);
            // 上传失败
            if (success == false) {
                return new Result(Result.Status.ERROR, Constant.UPLOAD_FAIL);
            } else {
                Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
                if (employee != null) { // 已经登陆
                    int row = employeeService.updateAvatar(employee.getId(), uploader.getFileName());
                    if (row > 0) {
                        employee.setAvatar(uploader.getFileName());
                        session.setAttribute(Constant.USERINFO, employee);
                        return new Result(Result.Status.SUCCESS, Constant.UPLOAD_SUCCESS);
                    } else {
                        return new Result(Result.Status.ERROR, Constant.UPLOAD_FAIL);
                    }
                }
            }
        } catch (Exception e) {
            return new Result(Result.Status.ERROR, Constant.UPLOAD_FAIL);
        }
        return new Result(Result.Status.SUCCESS, Constant.UPLOAD_SUCCESS);
    }

    /**
     * 更新用户资料
     *
     * @param session session
     * @param request request
     * @return
     */
    @RequestMapping(value = "/updateProfile", method = RequestMethod.POST)
    public @ResponseBody
    Result updateProfile(HttpSession session, HttpServletRequest request) {
        Employee loginEmployee = (Employee) session.getAttribute(Constant.USERINFO);
        Employee employee = new Employee();
        employee.setJob(request.getParameter("job"));
        employee.setBirthday(DateUtil.String2Date(request.getParameter("birthday")));
        employee.setAddress(request.getParameter("address"));
        employee.setPhone(request.getParameter("phone"));
        employee.setDescription(request.getParameter("description"));

        if (loginEmployee != null) {
            employee.setId(loginEmployee.getId());
            int row = employeeService.updateProfile(employee);
            if (row > 0) {
            	employee.setEmail(loginEmployee.getEmail());
                session.setAttribute(Constant.USERINFO, employee);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
    }

    /**
     * 修改密码
     *
     * @param session session
     * @param request request
     * @return
     */
    @RequestMapping(value = "/changePwd", method = RequestMethod.POST)
    public @ResponseBody
    Result changePwd(HttpSession session, HttpServletRequest request) {
        Employee loginEmployee = (Employee) session.getAttribute(Constant.USERINFO);

        String oldPwd = request.getParameter("old_pass");
        String newPwd = request.getParameter("new_pass");
        if (oldPwd.equals(newPwd)) {
            return new Result(Result.Status.ERROR, Constant.OLD_PWD_AND_NEW_PWD_CANNOT_BE_THE_SAME);
        }
        // 校验旧的密码
        String encStr = loginEmployee.getUsername() + Constant.MD5_HASH + oldPwd;
        encStr = MD5.digest(encStr);
        if (!encStr.equals(loginEmployee.getPassword())) {
            return new Result(Result.Status.ERROR, Constant.PWD_ERROR);
        } else {
            // 保存新密码
            encStr = MD5.digest(loginEmployee.getUsername() + Constant.MD5_HASH + newPwd);
            int row = employeeService.updatePassword(loginEmployee.getId(), encStr);
            if (row > 0) {// 更新Session中的用户信息
                loginEmployee.setPassword(encStr);
                session.setAttribute(Constant.USERINFO, loginEmployee);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        }
    }

    /**
     * 根据简历id删除简历
     *
     * @param id 简历id
     * @return success or fail
     */
    @RequestMapping(value = "/deleteResume", method = RequestMethod.POST)
    public @ResponseBody
    Result deleteResume(String id) {
        int row = resumeService.deleteResumeById(Integer.parseInt(id));
        if (row > 0) {
            return new Result(Result.Status.SUCCESS, Constant.DELETE_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DELETE_FAIL);
        }
    }

    /**
     * 更新简历的状态
     *
     * @param id 简历id
     * @param status 简历状态
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/updateResumeStatus", method = RequestMethod.POST)
    public @ResponseBody
    Result updateResumeStatus(Integer id, Integer status, HttpSession session) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            if (status.equals(1)) {
                // 状态可用
                List<Resume> avaliable = resumeService.getResumeListByUserId(employee.getId(), 1);
                if (avaliable.size() > 0) {
                    return new Result(Result.Status.ERROR, Constant.ONLY_ONE_RESUME_IS_AVAILABLE);
                }
            }

            // 更新简历的状态
            int row = resumeService.updateResumeStatus(id, status);
            if (row > 0) {
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
    }
}