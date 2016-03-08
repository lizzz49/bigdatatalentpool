package com.data.job.service;

import com.data.job.domain.Skill;

import java.util.List;

/**
 * 与SkillService相关接口
 * 主要包括：
 * 1.新增技能
 * 2.获得某个特定的技能
 * 3.获得技能列表
 * 4.根据id删除skill
 * 5.更新技能
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 3:08 PM.
 */
public interface SkillService {

    /**
     * 新增技能
     *
     * @param skill 技能
     * @return 技能id
     */
    int addSkill(Skill skill);

    /**
     * 获得某个特定的技能
     *
     * @param name 技能名
     * @param percent 百分比
     * @param resumeId 简历id
     * @return 技能
     */
    Skill getSpecificSkill(String name, Integer percent, Integer resumeId);

    /**
     * 获得技能列表
     *
     * @param resumeId 简历id
     * @return 技能列表
     */
    List<Skill> getSkillList(Integer resumeId);

    /**
     * 根据id删除skill
     *
     * @param id id
     * @return success or fail
     */
    int deleteSkillById(Integer id);

    /**
     * 更新技能
     *
     * @param skill 技能
     * @return success or fail
     */
    int updateSkill(Skill skill);
}