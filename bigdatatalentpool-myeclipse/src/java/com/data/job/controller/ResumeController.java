package com.data.job.controller;

import com.data.job.domain.*;
import com.data.job.service.*;
import com.data.job.util.BeanUtil;
import com.data.job.util.Constant;
import com.data.job.util.JsonUtil;
import com.data.job.util.Pager;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 简历控制器
 * 包括：
 * 1.简历列表
 * 2.加载简历列表
 * 3.简历详情
 *
 * @author tyee.noprom@qq.com
 * @time 2/12/16 4:44 PM.
 */
@Controller
public class ResumeController {

	public static Logger logger = Logger.getLogger(ResumeController.class.getName());
	
    // 静态资源前缀
    public static final String STATIC_PREFIX = "job/resume";

    // 自动加载EmployeeService
    @Autowired
    private EmployeeService employeeService;

    // 自动加载CategoryService
    @Autowired
    private CategoryService categoryService;

    // 自动加载CityService
    @Autowired
    private CityService cityService;

    // 自动加载 EmployeeService
    @Autowired
    private ResumeService resumeService;

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
     * 简历列表
     *
     * @param session session
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/resume", method = RequestMethod.GET)
    public String resume(HttpSession session, Model model) {
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        if (loginType != null) {
            model.addAttribute("loginType", loginType);
        }
        model.addAttribute("url", "/resume");
        return STATIC_PREFIX + "/resume";
    }

    /**
     * 加载简历列表
     *
     * @param model model
     * @param param 查询参数
     * @param pager 分页类
     * @return 人才列表
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/loadResume", method = RequestMethod.GET)
    public String loadResume(Model model, String param, Pager<Resume> pager) throws Exception {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        Resume resume = JsonUtil.fromJson(param, Resume.class);
        // 解码处理
        BeanUtil.decodeBean(resume);
        paramMap.put("resume", resume);
        List<Resume> resumeList = resumeService.getResumeList(paramMap, pager);
        model.addAttribute("resumeList", resumeList);
        model.addAttribute("pager", pager);
        return STATIC_PREFIX + "/resumeList";
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

            Employee employee = employeeService.getEmployeeById(resume.getEmployeeId());

            // 在视图上显示
            model.addAttribute(Constant.USERINFO, employee);
            model.addAttribute(Constant.BASIC_RESUME, basicResume);
            model.addAttribute(Constant.EXPERIENCE_LIST, experienceList);
            model.addAttribute(Constant.EDUCATION_LIST, educationList);
            model.addAttribute(Constant.SKILL_LIST, skillList);
            model.addAttribute(Constant.CURRENT_RESUME, resume);
            model.addAttribute("detail", "true");
        }
        return STATIC_PREFIX + "/resumeDetail";
    }
}
