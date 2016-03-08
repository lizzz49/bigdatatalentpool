package com.data.job.service.impl;

import com.data.job.domain.Education;
import com.data.job.mapper.EducationMapper;
import com.data.job.service.EducationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * EducationService 实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 11:54 PM.
 */
@Service
@Transactional(isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
public class EducationServiceImpl implements EducationService {

    @Autowired
    private EducationMapper educationMapper;

    /**
     * 新增教育信息
     *
     * @param education 教育信息
     * @return 新增成功的id
     */
    public int addEducation(Education education) {
        return educationMapper.addEducation(education);
    }

    /**
     * 根据学校查找教育信息
     *
     * @param resumeId resumeId
     * @param school 学校信息
     * @return 教育信息
     */
    public List<Education> getEducationBySchool(Integer resumeId, String school) {
        return educationMapper.getEducationBySchool(resumeId, school);
    }

    /**
     * 找到特定的教育信息
     *
     * @param resumeId 简历id
     * @param school 学校
     * @param qualification 资质
     * @param date 开始截止时间
     * @return 教育信息
     */
    public Education getSpecificEducation(Integer resumeId, String school, String qualification, String date) {
        return educationMapper.getSpecificEducation(resumeId, school, qualification, date);
    }

    /**
     * 获得教育列表
     *
     * @param resumeId 简历id
     * @return 列表
     */
    public List<Education> getEducationList(Integer resumeId) {
        return educationMapper.getEducationList(resumeId);
    }

    /**
     * 根据id删除教育信息
     *
     * @param id id
     * @return success or fail
     */
    public int deleteEducationById(Integer id) {
        return educationMapper.deleteEducationById(id);
    }

    /**
     * 更新教育信息
     *
     * @param education 教育信息
     * @return success or fail
     */
    public int updateEducation(Education education) {
        return educationMapper.updateEducation(education);
    }
}