package com.data.job.domain;

/**
 * 城市Model
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:24 PM.
 */
public class City {

    private Integer id;//主键
    private String name;//城市名称

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
}
