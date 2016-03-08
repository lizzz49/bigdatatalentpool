package com.data.job.service.impl;

import com.data.job.domain.Experience;
import com.data.job.mapper.ExperienceMapper;
import com.data.job.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ExperienceService 实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 11:49 AM.
 */
@Service
@Transactional(isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
public class ExperienceServiceImpl implements ExperienceService {

    @Autowired
    private ExperienceMapper experienceMapper;

    /**
     * 增加工作经历
     *
     * @param experience 工作经历
     * @return experienceId
     */
    public int addExperience(Experience experience) {
        return experienceMapper.addExperience(experience);
    }

    /**
     * 获得特定的工作经验
     *
     * @param title 称呼
     * @param date 开始截止时间
     * @param note 备注
     * @param resumeId 简历id
     * @return
     */
    public Experience getSpecificExperience(String title, String date, String note, Integer resumeId) {
        return experienceMapper.getSpecificExperience(title, date, note, resumeId);
    }

    /**
     * 获得经历列表
     *
     * @param resumeId 简历id
     * @return 经历列表
     */
    public List<Experience> getExperienceList(Integer resumeId) {
        return experienceMapper.getExperienceList(resumeId);
    }

    /**
     * 根据id删除工作经历
     *
     * @param id id
     * @return success or fail
     */
    public int deleteExperienceById(Integer id) {
        return experienceMapper.deleteExperienceById(id);
    }

    /**
     * 更新经历
     *
     * @param experience 经历
     * @return success or fail
     */
    public int updateExperience(Experience experience) {
        return experienceMapper.updateExperience(experience);
    }
}
