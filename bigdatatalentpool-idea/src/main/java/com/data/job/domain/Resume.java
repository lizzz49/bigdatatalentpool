package com.data.job.domain;

/**
 * 简历模型
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:42 PM.
 */
public class Resume {

    private Integer id;//主键
    private String title;//标题
    private Integer employeeId;//人才id
    private String highestDegree;//最高学历
    private String experience;//工作经历年限
    private String introduction;//自我介绍
    private String jobCategoryIds;//工作种类id
    private String cityIds;//所在城市id
    private Integer status;//是否可见,1=>可见,0=>不可见

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getJobCategoryIds() {
        return jobCategoryIds;
    }

    public void setJobCategoryIds(String jobCategoryIds) {
        this.jobCategoryIds = jobCategoryIds;
    }

    public String getCityIds() {
        return cityIds;
    }

    public void setCityIds(String cityIds) {
        this.cityIds = cityIds;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Resume{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", employeeId=" + employeeId +
                ", highestDegree='" + highestDegree + '\'' +
                ", experience='" + experience + '\'' +
                ", introduction='" + introduction + '\'' +
                ", jobCategoryIds='" + jobCategoryIds + '\'' +
                ", cityIds='" + cityIds + '\'' +
                ", status=" + status +
                '}';
    }
}
