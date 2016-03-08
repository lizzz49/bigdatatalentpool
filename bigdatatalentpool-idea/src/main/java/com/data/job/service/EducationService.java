package com.data.job.service;

import com.data.job.domain.Education;

import java.util.List;

/**
 * 与教育信息相关的接口
 * 主要包括：
 * 1.新增教育信息
 * 2.根据学校查找教育信息
 * 3.找到特定的教育信息
 * 4.获得教育列表
 * 5.根据id删除教育信息
 * 6.更新教育信息
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 11:53 PM.
 */
public interface EducationService {

    /**
     * 新增教育信息
     *
     * @param education 教育信息
     * @return id
     */
    int addEducation(Education education);

    /**
     * 根据学校查找教育信息
     *
     * @param resumeId resumeId
     * @param school 学校信息
     * @return 教育信息
     */
    List<Education> getEducationBySchool(Integer resumeId, String school);

    /**
     * 找到特定的教育信息
     *
     * @param resumeId 简历id
     * @param school 学校
     * @param qualification 资质
     * @param date 开始截止时间
     * @return 教育信息
     */
    Education getSpecificEducation(Integer resumeId, String school, String qualification, String date);

    /**
     * 获得教育列表
     *
     * @param resumeId 简历id
     * @return 列表
     */
    List<Education> getEducationList(Integer resumeId);

    /**
     * 根据id删除教育信息
     *
     * @param id id
     * @return success or fail
     */
    int deleteEducationById(Integer id);

    /**
     * 更新教育信息
     *
     * @param education 教育信息
     * @return success or fail
     */
    int updateEducation(Education education);
}
