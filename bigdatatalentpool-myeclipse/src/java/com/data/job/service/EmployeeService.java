package com.data.job.service;

import com.data.job.domain.Employee;
import com.data.job.util.Pager;

import java.util.HashMap;
import java.util.List;

/**
 * 与Employee 相关的接口
 * 主要包括：
 * 1.新增Employee
 * 2.根据用户名查找Employee
 * 3.Employee 登录
 * 4.通过id得到Employee
 * 5.更新头像
 * 6.更新资料
 * 7.更新密码
 * 8.获得人员列表
 * 9.获得最新的指定数量的employee列表
 *
 * @author tyee.noprom@qq.com
 * @info Created by noprom on 2/5/16.
 */
public interface EmployeeService {

    /**
     * 新增Employee
     *
     * @param employee Employee
     * @return Employee id
     */
    int addEmployee(Employee employee);

    /**
     * 根据用户名查找Employee
     *
     * @param username 用户名
     * @return Employee
     */
    Employee getEmployeeByUsername(String username);

    /**
     * Employee 登录
     *
     * @param employee employee
     * @return employee or null
     */
    Employee loginEmployee(Employee employee);

    /**
     * 通过id得到Employee
     *
     * @param id id
     * @return Employee
     */
    Employee getEmployeeById(Integer id);

    /**
     * 更新头像
     *
     * @param id id
     * @param avatar 头像
     * @return success or fail
     */
    int updateAvatar(Integer id, String avatar);

    /**
     * 更新资料
     *
     * @param employee employee
     * @return success or fail
     */
    int updateProfile(Employee employee);

    /**
     * 更新密码
     *
     * @param id 用户id
     * @param password 新密码
     * @return success or fail
     */
    int updatePassword(Integer id, String password);

    /**
     * 获得人员列表
     *
     * @param paramMap 查询参数
     * @param pager 分页类
     * @return 列表
     */
    List<Employee> getEmployeeList(HashMap<String, Object> paramMap, Pager<Employee> pager);

    /**
     * 获得最新的指定数量的employee列表
     *
     * @param limit 数量
     * @return 列表
     */
    List<Employee> getAEmployeeList(int limit);
}
