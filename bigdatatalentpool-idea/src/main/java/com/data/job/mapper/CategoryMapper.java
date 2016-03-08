package com.data.job.mapper;

import com.data.job.domain.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 工作种类Mapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 12:09 PM.
 */
public interface CategoryMapper {

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
    Category getCategoryById(@Param("id") Integer id);
}