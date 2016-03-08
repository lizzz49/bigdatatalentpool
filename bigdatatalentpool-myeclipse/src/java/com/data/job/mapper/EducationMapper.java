package com.data.job.mapper;

import com.data.job.domain.Education;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * EducationMapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 11:46 PM.
 */
public interface EducationMapper {

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
    List<Education> getEducationBySchool(@Param("resumeId") Integer resumeId, @Param("school") String school);

    /**
     * 找到特定的教育信息
     *
     * @param resumeId 简历id
     * @param school 学校
     * @param qualification 资质
     * @param date 开始截止时间
     * @return 教育信息
     */
    Education getSpecificEducation(@Param("resumeId") Integer resumeId, @Param("school") String school, @Param("qualification") String qualification, @Param("date") String date);

    /**
     * 获得教育列表
     *
     * @param resumeId 简历id
     * @return 列表
     */
    List<Education> getEducationList(@Param("resumeId") Integer resumeId);

    /**
     * 根据id删除教育信息
     *
     * @param id id
     * @return success or fail
     */
    int deleteEducationById(@Param("id") Integer id);

    /**
     * 更新教育信息
     *
     * @param education 教育信息
     * @return success or fail
     */
    int updateEducation(Education education);
}