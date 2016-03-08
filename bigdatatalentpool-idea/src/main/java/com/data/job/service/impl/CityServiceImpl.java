package com.data.job.service.impl;

import com.data.job.domain.City;
import com.data.job.mapper.CityMapper;
import com.data.job.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * CityService 实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:28 PM.
 */
@Service
@Transactional(isolation= Isolation.DEFAULT,rollbackFor=Exception.class)
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;

    /**
     * 获得城市列表
     *
     * @return 城市列表
     */
    public List<City> getCityList() {
        return cityMapper.getCityList();
    }

    /**
     * 根据id获得城市
     *
     * @param id id
     * @return 城市
     */
    public City getCityById(Integer id) {
        return cityMapper.getCityById(id);
    }
}
