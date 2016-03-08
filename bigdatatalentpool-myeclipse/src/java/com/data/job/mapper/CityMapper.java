package com.data.job.mapper;

import com.data.job.domain.City;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * CityMapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:25 PM.
 */
public interface CityMapper {

    /**
     * 获得城市列表
     *
     * @return
     */
    List<City> getCityList();

    /**
     * 根据id获得城市
     *
     * @param id id
     * @return 城市
     */
    City getCityById(@Param("id") Integer id);
}
