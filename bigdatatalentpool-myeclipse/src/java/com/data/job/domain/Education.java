package com.data.job.domain;

/**
 * 简历上面的教育信息
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 11:42 PM.
 */
public class Education {

    private Integer id;//主键
    private String school;//学校
    private String qualification;//资质
    private String date;//开始截止时间
    private String note;//备注
    private Integer resumeId;//简历的id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getResumeId() {
        return resumeId;
    }

    public void setResumeId(Integer resumeId) {
        this.resumeId = resumeId;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        Education other = (Education) obj;

        if (id == null) {
            if (other.getId() != null)
                return false;
        } else if (!id.equals(other.getId())
                || !school.equals(other.getSchool())
                || !qualification.equals(other.getQualification())
                || !date.equals(other.getDate())
                || !note.equals(other.getNote())
                || !resumeId.equals(other.getResumeId()))
            return false;
        return true;
    }
}