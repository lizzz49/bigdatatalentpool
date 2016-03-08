package com.data.job.service;

import com.data.job.domain.City;

import java.util.List;

/**
 * 城市Service
 * 主要包括：
 * 1.获得城市列表
 * 2.根据id获得城市
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:27 PM.
 */
public interface CityService {

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
    City getCityById(Integer id);
}
