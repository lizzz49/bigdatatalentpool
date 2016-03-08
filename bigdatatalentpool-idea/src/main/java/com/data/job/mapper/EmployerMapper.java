package com.data.job.mapper;

import com.data.job.domain.Employer;

/**
 * 招聘者接口
 *
 * @author tyee.noprom@qq.com
 * @time 2/5/16 4:19 PM.
 */
public interface EmployerMapper {

    /**
     * 新增Employer
     *
     * @param employer employer
     * @return employer id
     */
    int addEmployer(Employer employer);

    /**
     * 根据用户名查找Employer
     *
     * @param username 用户名
     * @return Employer
     */
    Employer getEmployerByUsername(String username);

    /**
     * Employer 登录
     *
     * @param employer employer
     * @return employer or null
     */
    Employer loginEmployer(Employer employer);
}
