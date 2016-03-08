package com.data.job.domain;

/**
 * 工作种类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 12:08 PM.
 */
public class Category {

    private Integer id;//主键
    private String name;//名称
    private String title;//标题

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
