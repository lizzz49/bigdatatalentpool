package com.data.job.domain;

/**
 * 工作经历Model
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 10:59 AM.
 */
public class Experience {

    private Integer id;//主键
    private String title;//称呼
    private String date;//开始截止时间
    private String note;//备注
    private Integer resumeId;//简历id

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
}
