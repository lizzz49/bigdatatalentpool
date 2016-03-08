package com.data.job.service.impl;

import com.data.job.domain.Skill;
import com.data.job.mapper.SkillMapper;
import com.data.job.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author tyee.noprom@qq.com
 * @time 2/7/16 3:09 PM.
 */
@Service
@Transactional(isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
public class SkillServiceImpl implements SkillService {

    @Autowired
    private SkillMapper skillMapper;

    /**
     * 新增技能
     *
     * @param skill 技能
     * @return 技能id
     */
    public int addSkill(Skill skill) {
        return skillMapper.addSkill(skill);
    }

    /**
     * 获得某个特定的技能
     *
     * @param name 技能名
     * @param percent 百分比
     * @param resumeId 简历id
     * @return 技能
     */
    public Skill getSpecificSkill(String name, Integer percent, Integer resumeId) {
        return skillMapper.getSpecificSkill(name, percent, resumeId);
    }

    /**
     * 获得技能列表
     *
     * @param resumeId 简历id
     * @return 技能列表
     */
    public List<Skill> getSkillList(Integer resumeId) {
        return skillMapper.getSkillList(resumeId);
    }

    /**
     * 根据id删除skill
     *
     * @param id id
     * @return success or fail
     */
    public int deleteSkillById(Integer id) {
        return skillMapper.deleteSkillById(id);
    }

    /**
     * 更新技能
     *
     * @param skill 技能
     * @return success or fail
     */
    public int updateSkill(Skill skill) {
        return skillMapper.updateSkill(skill);
    }
}
