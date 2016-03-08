package com.data.job.service;

import com.data.job.domain.Employer;

/**
 * 与Employer相关的接口
 * 主要包括：
 * 1.新增Employer
 * 2.根据用户名查找Employer
 * 3.Employer 登录
 *
 * @author tyee.noprom@qq.com
 * @time 2/5/16 4:24 PM.
 */
public interface EmployerService {

    /**
     * 新增Employer
     *
     * @param employer Employer
     * @return Employer id
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
