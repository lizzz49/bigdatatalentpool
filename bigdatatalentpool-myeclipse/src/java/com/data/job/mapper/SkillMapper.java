package com.data.job.mapper;

import com.data.job.domain.Skill;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * SkillMapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 12:48 PM.
 */
public interface SkillMapper {

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
    Skill getSpecificSkill(@Param("name") String name, @Param("percent") Integer percent, @Param("resumeId") Integer resumeId);

    /**
     * 获得技能列表
     *
     * @param resumeId 简历id
     * @return 技能列表
     */
    List<Skill> getSkillList(@Param("resumeId") Integer resumeId);

    /**
     * 根据id删除skill
     *
     * @param id id
     * @return success or fail
     */
    int deleteSkillById(@Param("id") Integer id);

    /**
     * 更新技能
     *
     * @param skill 技能
     * @return success or fail
     */
    int updateSkill(Skill skill);
}
