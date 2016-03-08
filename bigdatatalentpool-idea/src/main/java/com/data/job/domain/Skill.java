package com.data.job.domain;

/**
 * Skill 模型
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 12:48 PM.
 */
public class Skill {

    private Integer id;//主键
    private String name;//技能名称
    private Integer percent;//百分比
    private Integer resumeId;//简历id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }
}
