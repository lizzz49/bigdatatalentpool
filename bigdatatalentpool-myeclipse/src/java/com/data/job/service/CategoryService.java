package com.data.job.service;

import com.data.job.domain.Category;

import java.util.List;

/**
 * 种类Service
 * 主要包括：
 * 1.获得种类列表
 * 2.根据id获得工作种类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 12:14 PM.
 */
public interface CategoryService {

    /**
     * 获得种类列表
     *
     * @return 列表
     */
    List<Category> getCategoryList();

    /**
     * 根据id获得工作种类
     *
     * @param id id
     * @return 种类
     */
    Category getCategoryById(Integer id);
}
