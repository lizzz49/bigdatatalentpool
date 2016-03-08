package com.data.job.mapper;

import com.data.job.domain.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * 应聘者Mapper
 *
 * @author tyee.noprom@qq.com
 * @info Created by noprom on 2/5/16.
 */
public interface EmployeeMapper {

    /**
     * 通过id得到Employee
     *
     * @param id id
     * @return Employee
     */
    Employee getEmployeeById(@Param("id") Integer id);

    /**
     * 新增Employee
     *
     * @param employee employee
     * @return employee id
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
     * 更新头像
     *
     * @param id id
     * @param avatar 头像
     * @return success or fail
     */
    int updateAvatar(@Param("id") Integer id, @Param("avatar") String avatar);

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
    int updatePassword(@Param("id") Integer id, @Param("password") String password);

    /**
     * 获得人员数量
     *
     * @param paramMap 查询参数
     * @return 数量
     */
    int getEmployeeCount(HashMap<String, Object> paramMap);

    /**
     * 获得人员列表
     *
     * @param paramMap 查询参数
     * @return 列表
     */
    List<Employee> getEmployeeList(HashMap<String, Object> paramMap);

    /**
     * 获得最新的指定数量的employee列表
     *
     * @param limit 数量
     * @return 列表
     */
    List<Employee> getAEmployeeList(@Param("limit") int limit);
}
