package com.data.job.controller;

import com.data.job.domain.*;
import com.data.job.service.*;
import com.data.job.util.Constant;
import com.data.job.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 发布简历控制器
 * 主要包含以下功能:
 * 1.发布简历基本信息
 * 2.新增、编辑简历基本信息
 * 3.发布、编辑简历详情
 * 4.增加、编辑、删除教育信息
 * 5.增加、编辑、删除工作经历
 * 6.新增、编辑、删除技能
 * 7.预览简历
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 12:08 AM.
 */
@Controller
public class PostController {

    // 静态资源前缀
    public static final String STATIC_PREFIX = "job/post";

    // 自动加载CategoryService
    @Autowired
    private CategoryService categoryService;

    // 自动加载CityService
    @Autowired
    private CityService cityService;

    // 自动加载ResumeService
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
     * 检查是否可以发布简历
     *
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/postResume", method = RequestMethod.POST)
    public @ResponseBody
    Result postResume(HttpSession session) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            List<Resume> resumeList = resumeService.getResumeListByUserId(employee.getId(), 1);
            if (resumeList.size() > 0) {// 已经存在公开显示的简历，这种情况下不能再添加简历了
                return new Result(Result.Status.ERROR, Constant.PUBLIC_RESUME_ALREADY_EXISTS);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
        return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
    }

    /**
     * 发布简历基本信息
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/postInfo", method = RequestMethod.GET)
    public String postInfo(Model model, HttpSession session) {
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        if (employee != null) {
            model.addAttribute(Constant.USERINFO, employee);
        }
        model.addAttribute("categoryList", categoryService.getCategoryList());
        model.addAttribute("cityList", cityService.getCityList());
        return STATIC_PREFIX + "/postInfo";
    }

    /**
     * 编辑简历基本信息
     *
     * @param model model
     * @return 视图
     */
    @RequestMapping(value = "/postInfo/{id}", method = RequestMethod.GET)
    public String postEditInfo(Model model, @PathVariable Integer id) {
        List<Category> allCategory = categoryService.getCategoryList();
        List<City> allCity = cityService.getCityList();

        if (id != null) {//编辑简历
            Resume resume = resumeService.getResumeById(id);
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
            // 得到选择的
            // 下拉选择框的结果
            List<CategorySelectResult> categorySelectResultList = new ArrayList<CategorySelectResult>();
            for (Category category : allCategory) {
                CategorySelectResult categorySelectResult = new CategorySelectResult();
                categorySelectResult.setCategory(category);
                if (categoryList.contains(category)) {
                    // 该项已经选择
                    categorySelectResult.setChosen(true);
                } else {
                    categorySelectResult.setChosen(false);
                }
                categorySelectResultList.add(categorySelectResult);
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
            // 下拉选择框的结果
            List<CitySelectResult> citySelectResultList = new ArrayList<CitySelectResult>();
            for (City city : allCity) {
                CitySelectResult citySelectResult = new CitySelectResult();
                citySelectResult.setCity(city);
                if (cityList.contains(city)) {
                    citySelectResult.setChosen(true);
                } else {
                    citySelectResult.setChosen(false);
                }
                citySelectResultList.add(citySelectResult);
            }

            model.addAttribute("chosenCategoryList", categoryList);
            model.addAttribute("chosenCityList", cityList);
            model.addAttribute("categorySelectResultList", categorySelectResultList);
            model.addAttribute("citySelectResultList", citySelectResultList);
            model.addAttribute("resume", resume);
        }
        model.addAttribute("categoryList", allCategory);
        model.addAttribute("cityList", allCity);
        return STATIC_PREFIX + "/postInfo";
    }

    /**
     * 新增简历基本信息
     *
     * @param resume 简历
     * @return fail or success
     */
    @RequestMapping(value = "/postInfo", method = RequestMethod.POST)
    public @ResponseBody
    Result handlePostInfo(Resume resume, HttpSession session) {
        // 填充Resume
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        if (loginType != null && loginType.equals("Employee")) {
            Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
            resume.setEmployeeId(employee.getId());
        } else if (loginType == null) {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }

        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        // 根据title检测是否存在同样的resume
        Resume oldResume = resumeService.getResumeByTitle(resume.getTitle(), employee.getId());
        if (oldResume != null) {
            return new Result(Result.Status.ERROR, Constant.RESUME_EXISTS);
        }

        // 新增 Resume
        Integer id = resumeService.addResume(resume);
        if (id > 0) {
            resume.setId(resumeService.getResumeByTitle(resume.getTitle(), employee.getId()).getId());
            session.setAttribute(Constant.CURRENT_RESUME, resume);
            return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
        }
    }

    /**
     * 编辑简历基本信息
     *
     * @param resume 简历
     * @return fail or success
     */
    @RequestMapping(value = "/postInfo/{id}", method = RequestMethod.POST)
    public @ResponseBody
    Result handleEditPostInfo(Resume resume, HttpSession session, @PathVariable("id") Integer resumeId) {
        // 填充Resume
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        if (loginType != null && loginType.equals("Employee")) {
            Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
            resume.setEmployeeId(employee.getId());
            resume.setId(resumeId);
        } else if (loginType == null) {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }

        // 更新 Resume
        Integer row = resumeService.updateResume(resume);
        if (row > 0) {
            return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
        }
    }

    /**
     * 编辑简历详情
     *
     * @return 视图
     */
    @RequestMapping(value = "/postDetail/{id}", method = RequestMethod.GET)
    public String postEditDetail(@PathVariable("id") Integer id, Model model) throws IOException {
        if (id != null && id > 0) {//编辑简历
            Resume resume = resumeService.getResumeById(id);
            // 分别得到教育信息、工作经历和技能的列表
            List<Education> educationList = educationService.getEducationList(id);
            List<Experience> experienceList = experienceService.getExperienceList(id);
            List<Skill> skillList = skillService.getSkillList(id);

            model.addAttribute("educationList", educationList);
            model.addAttribute("experienceList", experienceList);
            model.addAttribute("skillList", skillList);
            model.addAttribute("resume", resume);
        }
        return STATIC_PREFIX + "/postDetail";
    }

    /**
     * 发布简历详情
     *
     * @return 视图
     */
    @RequestMapping(value = "/postDetail", method = RequestMethod.GET)
    public String postDetail() throws IOException {
        return STATIC_PREFIX + "/postDetail";
    }

    /**
     * 增加教育信息
     *
     * @param education 教育信息
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/addEducation", method = RequestMethod.POST)
    public @ResponseBody
    Result addEducation(Education education, HttpSession session) {
        // 填充Education
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        Resume resume = (Resume) session.getAttribute(Constant.CURRENT_RESUME);

        // 登录且已经添加了基本简历信息
        if (employee != null && loginType.equals("Employee") && resume != null) {
            education.setResumeId(resume.getId());
            // 过滤相同的教育信息
            Education oldEducation = educationService.getSpecificEducation(education.getResumeId(), education.getSchool(), education.getQualification(), education.getDate());
            if (oldEducation != null) {
                return new Result(Result.Status.ERROR, Constant.EDUCATION_EXISTS);
            }

            Integer id = educationService.addEducation(education);
            if (id > 0) {
                // 成功添加教育信息
                session.setAttribute(Constant.ADD_EDUCATION_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.YOU_MUST_LOGIN_AND_ADD_RESUME);
        }
    }

    /**
     * 编辑教育信息
     *
     * @param education 教育信息
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/editEducation", method = RequestMethod.POST)
    public @ResponseBody
    Result editEducation(Education education, HttpSession session) {
        // 填充Education
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        // 确保用户已经登录
        if (employee != null && loginType.equals("Employee")) {
            Integer row = educationService.updateEducation(education);
            if (row > 0) {
                // 成功编辑教育信息
                // session.setAttribute(Constant.ADD_EDUCATION_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
    }

    /**
     * 增加工作经历
     *
     * @param experience 工作经历
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/addExperience", method = RequestMethod.POST)
    public @ResponseBody
    Result addExperience(Experience experience, HttpSession session) {
        // 填充Experience
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        Resume resume = (Resume) session.getAttribute(Constant.CURRENT_RESUME);

        // 登录且已经添加了基本简历信息
        if (employee != null && loginType.equals("Employee") && resume != null) {
            experience.setResumeId(resume.getId());
            // 过滤相同的工作经历
            Experience oldExperience = experienceService.getSpecificExperience(experience.getTitle(), experience.getDate(), experience.getNote(), experience.getResumeId());
            if (oldExperience != null) {
                return new Result(Result.Status.ERROR, Constant.EXPERIENCE_EXISTS);
            }

            Integer id = experienceService.addExperience(experience);
            if (id > 0) {
                // 成功添加工作经验
                session.setAttribute(Constant.ADD_EXPERIENCE_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.YOU_MUST_LOGIN_AND_ADD_RESUME);
        }
    }

    /**
     * 编辑工作经历
     *
     * @param experience 工作经历
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/editExperience", method = RequestMethod.POST)
    public @ResponseBody
    Result editExperience(Experience experience, HttpSession session) {
        // 填充Experience
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);

        // 确保用户已经登陆
        if (employee != null && loginType.equals("Employee")) {

            Integer row = experienceService.updateExperience(experience);
            if (row > 0) {
                // 成功编辑工作经历
                // session.setAttribute(Constant.ADD_EXPERIENCE_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
    }

    /**
     * 新增技能
     *
     * @param skill 技能
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/addSkill", method = RequestMethod.POST)
    public @ResponseBody
    Result addSkill(Skill skill, HttpSession session) {
        // 填充Skill
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        Resume resume = (Resume) session.getAttribute(Constant.CURRENT_RESUME);

        // 登录且已经添加了基本简历信息
        if (employee != null && loginType.equals("Employee") && resume != null) {
            skill.setResumeId(resume.getId());
            // 过滤相同的技能
            Skill oldSkill = skillService.getSpecificSkill(skill.getName(), skill.getPercent(), skill.getResumeId());
            if (oldSkill != null) {
                return new Result(Result.Status.ERROR, Constant.SKILL_EXISTS);
            }

            Integer id = skillService.addSkill(skill);
            if (id > 0) {
                // 成功添加技能
                session.setAttribute(Constant.ADD_SKILL_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.YOU_MUST_LOGIN_AND_ADD_RESUME);
        }
    }

    /**
     * 编辑技能
     *
     * @param skill 技能
     * @param session session
     * @return success or fail
     */
    @RequestMapping(value = "/editSkill", method = RequestMethod.POST)
    public @ResponseBody
    Result editSkill(Skill skill, HttpSession session) {
        // 填充Skill
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);

        // 确保用户已经登陆
        if (employee != null && loginType.equals("Employee")) {

            Integer row = skillService.updateSkill(skill);
            if (row > 0) {
                // 成功编辑技能
                // session.setAttribute(Constant.ADD_SKILL_DONE, true);
                return new Result(Result.Status.SUCCESS, Constant.DEAL_SUCCESS);
            } else {
                return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
            }
        } else {
            return new Result(Result.Status.ERROR, Constant.HAS_NOT_LOGIN);
        }
    }

    /**
     * 预览简历
     *
     * @param model model
     * @param session session
     * @return 视图
     */
    @RequestMapping(value = "/postPreview", method = RequestMethod.GET)
    public String postPreview(Model model, HttpSession session) {
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        Resume resume = (Resume) session.getAttribute(Constant.CURRENT_RESUME);

        // 登录且已经添加了基本简历信息
        if (employee != null && loginType.equals("Employee") && resume != null) {
            // 基本简历信息
            String[] categoryIds = resume.getJobCategoryIds().split(",");
            String[] cityIds = resume.getCityIds().split(",");
            // 基本简历包含的工作种类
            List<Category> categoryList = new ArrayList<Category>();
            for(String id : categoryIds) {
                Category category = new Category();
                category = categoryService.getCategoryById(Integer.parseInt(id));
                if (category != null) {
                    categoryList.add(category);
                }
            }
            // 基本简历包含的城市列表
            List<City> cityList = new ArrayList<City>();
            for (String id : cityIds) {
                City city = new City();
                city = cityService.getCityById(Integer.parseInt(id));
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
        } else {

        }
        return STATIC_PREFIX + "/postPreview";
    }

    /**
     * 预览简历详情
     *
     * @param model model
     * @param session session
     * @return 视图
     */
    @RequestMapping(value = "/postPreview/{id}", method = RequestMethod.GET)
    public String postPreviewDetail(@PathVariable("id") Integer id, Model model, HttpSession session) {
        String loginType = (String) session.getAttribute(Constant.LOGIN_TYPE);
        Employee employee = (Employee) session.getAttribute(Constant.USERINFO);
        Resume resume = resumeService.getResumeById(id);

        // 登录且已经添加了基本简历信息
        if (employee != null && loginType.equals("Employee") && resume != null) {
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
            model.addAttribute("EDIT", true);
        } else {

        }
        return STATIC_PREFIX + "/postPreview";
    }

    /**
     * 删除教育信息
     *
     * @param id 主键
     * @return success or fail
     */
    @RequestMapping(value = "/deleteEdu", method = RequestMethod.POST)
    public @ResponseBody
    Result deleteEdu(String id) {
        int row = educationService.deleteEducationById(Integer.parseInt(id));
        if (row > 0) {
            return new Result(Result.Status.SUCCESS, Constant.DELETE_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
        }
    }

    /**
     * 删除工作经验
     *
     * @param id 主键
     * @return success or fail
     */
    @RequestMapping(value = "/deleteExp", method = RequestMethod.POST)
    public @ResponseBody
    Result deleteExp(String id) {
        int row = experienceService.deleteExperienceById(Integer.parseInt(id));
        if (row > 0) {
            return new Result(Result.Status.SUCCESS, Constant.DELETE_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
        }
    }

    /**
     * 删除技能
     *
     * @param id id
     * @return success or fail
     */
    @RequestMapping(value = "/deleteSkill", method = RequestMethod.POST)
    public @ResponseBody
    Result deleteSkill(String id) {
        int row = skillService.deleteSkillById(Integer.parseInt(id));
        if (row > 0) {
            return new Result(Result.Status.SUCCESS, Constant.DELETE_SUCCESS);
        } else {
            return new Result(Result.Status.ERROR, Constant.DEAL_FAIL);
        }
    }
}