package com.data.job.service.impl;

import com.data.job.domain.Employee;
import com.data.job.mapper.EmployeeMapper;
import com.data.job.service.EmployeeService;
import com.data.job.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * EmployeeService
 *
 * @author tyee.noprom@qq.com
 * @info Created by noprom on 2/5/16.
 */
@Service
@Transactional(isolation= Isolation.DEFAULT,rollbackFor=Exception.class)
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 新增Employee
     *
     * @param employee Employee
     * @return employee id
     */
    public int addEmployee(Employee employee) {
        return employeeMapper.addEmployee(employee);
    }

    /**
     * 根据用户名查找Employee
     *
     * @param username 用户名
     * @return Employee
     */
    public Employee getEmployeeByUsername(String username) {
        return employeeMapper.getEmployeeByUsername(username);
    }

    /**
     * Employee 登录
     *
     * @param employee employee
     * @return employee or null
     */
    public Employee loginEmployee(Employee employee) {
        return employeeMapper.loginEmployee(employee);
    }

    /**
     * 通过id得到Employee
     *
     * @param id id
     * @return Employee
     */
    public Employee getEmployeeById(Integer id) {
        return employeeMapper.getEmployeeById(id);
    }

    /**
     * 更新头像
     *
     * @param id id
     * @param avatar 头像
     * @return success or fail
     */
    public int updateAvatar(Integer id, String avatar) {
        return employeeMapper.updateAvatar(id, avatar);
    }

    /**
     * 更新资料
     *
     * @param employee employee
     * @return success or fail
     */
    public int updateProfile(Employee employee) {
        return employeeMapper.updateProfile(employee);
    }

    /**
     * 更新密码
     *
     * @param id 用户id
     * @param password 新密码
     * @return success or fail
     */
    public int updatePassword(Integer id, String password) {
        return employeeMapper.updatePassword(id, password);
    }

    /**
     * 获得人员列表
     *
     * @param paramMap 查询参数
     * @param pager 分页类
     * @return 列表
     */
    public List<Employee> getEmployeeList(HashMap<String, Object> paramMap, Pager<Employee> pager) {
        List<Employee> employeeList = null;
        int count = employeeMapper.getEmployeeCount(paramMap);
        pager.setTotalCount(count);
        if (count > 0) {
            paramMap.put("start", pager.getStart());
            paramMap.put("limit", pager.getLimit());
            employeeList = employeeMapper.getEmployeeList(paramMap);
        }
        return employeeList;
    }

    /**
     * 获得最新的指定数量的employee列表
     *
     * @param limit 数量
     * @return 列表
     */
    public List<Employee> getAEmployeeList(int limit) {
        return employeeMapper.getAEmployeeList(limit);
    }
}
