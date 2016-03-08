package com.data.job.service;

import com.data.job.domain.Experience;

import java.util.List;

/**
 * ExperienceService
 * 主要包括：
 * 1.增加工作经历
 * 2.获得特定的工作经验
 * 3.获得经历列表
 * 4.根据id删除工作经历
 * 5.更新经历
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 11:48 AM.
 */
public interface ExperienceService {

    /**
     * 增加工作经历
     *
     * @param experience 工作经历
     * @return experienceId
     */
    int addExperience(Experience experience);

    /**
     * 获得特定的工作经验
     *
     * @param title 称呼
     * @param date 开始截止时间
     * @param note 备注
     * @param resumeId 简历id
     * @return
     */
    Experience getSpecificExperience(String title, String date, String note, Integer resumeId);

    /**
     * 获得经历列表
     *
     * @param resumeId 简历id
     * @return 经历列表
     */
    List<Experience> getExperienceList(Integer resumeId);

    /**
     * 根据id删除工作经历
     *
     * @param id id
     * @return success or fail
     */
    int deleteExperienceById(Integer id);

    /**
     * 更新经历
     *
     * @param experience 经历
     * @return success or fail
     */
    int updateExperience(Experience experience);
}
