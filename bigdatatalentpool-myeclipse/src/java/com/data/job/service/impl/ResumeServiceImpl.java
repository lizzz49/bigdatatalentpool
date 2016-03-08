package com.data.job.service.impl;

import com.data.job.domain.Resume;
import com.data.job.mapper.ResumeMapper;
import com.data.job.service.ResumeService;
import com.data.job.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * ResumeService 实现类
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 3:26 PM.
 */
@Service
@Transactional(isolation= Isolation.DEFAULT,rollbackFor=Exception.class)
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;

    /**
     * 新增Resume
     *
     * @param resume resume
     * @return resumeId
     */
    public int addResume(Resume resume) {
        return resumeMapper.addResume(resume);
    }

    /**
     * 根据title查找Resume
     *
     * @param title 标题
     * @param id employee id
     * @return Resume
     */
    public Resume getResumeByTitle(String title, Integer id) {
    	return resumeMapper.getResumeByTitle(title, id);
    }

    /**
     * 根据id获得简历详情
     *
     * @param id
     * @return
     */
    public Resume getResumeById(Integer id) {
        return resumeMapper.getResumeById(id);
    }

    /**
     * 根据用户id获得简历列表
     *
     * @param id 用户id
     * @param status 状态
     * @return 简历列表
     */
    public List<Resume> getResumeListByUserId(Integer id, Integer status) {
        return resumeMapper.getResumeListByUserId(id, status);
    }

    /**
     * 根据id删除简历
     *
     * @param id id
     * @return success or fail
     */
    public int deleteResumeById(Integer id) {
        return resumeMapper.deleteResumeById(id);
    }

    /**
     * 更新resume的状态
     *
     * @param id 编号
     * @param status 状态
     * @return success or fail
     */
    public int updateResumeStatus(Integer id, Integer status) {
        return resumeMapper.updateResumeStatus(id, status);
    }

    /**
     * 更新Resume
     *
     * @param resume resume
     * @return success or fail
     */
    public int updateResume(Resume resume) {
        return resumeMapper.updateResume(resume);
    }

    /**
     * 获得简历列表
     *
     * @param paramMap 查询参数
     * @param pager 分页类
     * @return 列表
     */
    public List<Resume> getResumeList(HashMap<String, Object> paramMap, Pager<Resume> pager) {
        List<Resume> resumeList = null;
        int count = resumeMapper.getResumeCount(paramMap);
        pager.setTotalCount(count);
        if (count > 0) {
            paramMap.put("start", pager.getStart());
            paramMap.put("limit", pager.getLimit());
            resumeList = resumeMapper.getResumeList(paramMap);
        }
        return resumeList;
    }

    /**
     * 获得指定数量的简历列表
     *
     * @param limit 数量
     * @return 列表
     */
    public List<Resume> getAResumeList(int limit) {
        return resumeMapper.getAResumeList(limit);
    }
}
