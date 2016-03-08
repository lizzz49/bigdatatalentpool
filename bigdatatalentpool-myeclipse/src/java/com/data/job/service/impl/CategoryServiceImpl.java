package com.data.job.service.impl;

import com.data.job.domain.Category;
import com.data.job.mapper.CategoryMapper;
import com.data.job.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CategoryService实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 12:14 PM.
 */
@Service
@Transactional(isolation = Isolation.DEFAULT,rollbackFor=Exception.class)
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    /**
     * 获得种类列表
     *
     * @return 列表
     */
    public List<Category> getCategoryList() {
        return categoryMapper.getCategoryList();
    }

    /**
     * 根据id获得工作种类
     *
     * @param id id
     * @return 种类
     */
    public Category getCategoryById(Integer id) {
        return categoryMapper.getCategoryById(id);
    }
}
