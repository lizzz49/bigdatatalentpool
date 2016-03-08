package com.data.job.service.impl;

import com.data.job.domain.Employer;
import com.data.job.mapper.EmployerMapper;
import com.data.job.service.EmployerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

/**
 * EmployerService实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/5/16 4:25 PM.
 */
@Service
@Transactional(isolation= Isolation.DEFAULT,rollbackFor=Exception.class)
public class EmployerServiceImpl implements EmployerService {

    @Autowired
    private EmployerMapper employerMapper;

    /**
     * 新增Employer
     *
     * @param employer Employer
     * @return Employer id
     */
    public int addEmployer(Employer employer) {
        return employerMapper.addEmployer(employer);
    }

    /**
     * 根据用户名查找Employer
     *
     * @param username 用户名
     * @return Employer
     */
    public Employer getEmployerByUsername(String username) {
        return employerMapper.getEmployerByUsername(username);
    }

    /**
     * Employer 登录
     *
     * @param employer employer
     * @return employer or null
     */
    public Employer loginEmployer(Employer employer) {
        return employerMapper.loginEmployer(employer);
    }
}
