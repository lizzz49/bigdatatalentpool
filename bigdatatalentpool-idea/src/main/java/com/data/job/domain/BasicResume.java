package com.data.job.domain;

import java.util.List;

/**
 * 基本简历信息实体类
 *
 * @author tyee.noprom@qq.com
 * @time 2/7/16 4:36 PM.
 */
public class BasicResume {

    private Resume resume;//数据库对应resume表
    private List<Category> categoryList;//简历中的工作分类
    private List<City> cityList;//城市列表

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }
}
