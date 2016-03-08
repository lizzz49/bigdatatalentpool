package com.data.job.mapper;

import com.data.job.domain.Experience;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ExperienceMapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 11:02 AM.
 */
public interface ExperienceMapper {

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
    Experience getSpecificExperience(@Param("title") String title, @Param("date") String date, @Param("note") String note, @Param("resumeId") Integer resumeId);

    /**
     * 获得经历列表
     *
     * @param resumeId 简历id
     * @return 经历列表
     */
    List<Experience> getExperienceList(@Param("resumeId") Integer resumeId);

    /**
     * 根据id删除工作经历
     *
     * @param id id
     * @return success or fail
     */
    int deleteExperienceById(@Param("id") Integer id);

    /**
     * 更新经历
     *
     * @param experience 经历
     * @return success or fail
     */
    int updateExperience(Experience experience);
}
