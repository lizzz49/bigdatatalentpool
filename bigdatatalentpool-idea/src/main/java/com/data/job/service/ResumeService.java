package com.data.job.service;

import com.data.job.domain.Resume;
import com.data.job.util.Pager;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * ResumeService相关接口
 * 主要包括：
 * 1.新增Resume
 * 2.根据title查找Resume
 * 3.根据id获得简历详情
 * 4.根据用户id获得简历列表
 * 5.根据id删除简历
 * 6.更新resume的状态
 * 7.更新Resume
 * 8.获得简历列表
 * 9.获得指定数量的简历列表
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 3:25 PM.
 */
public interface ResumeService {

    /**
     * 新增Resume
     *
     * @param resume resume
     * @return resumeId
     */
    int addResume(Resume resume);

    /**
     * 根据title查找Resume
     *
     * @param title 标题
     * @param id employee id
     * @return Resume
     */
    Resume getResumeByTitle(String title, Integer id);

    /**
     * 根据id获得简历详情
     *
     * @param id
     * @return
     */
    Resume getResumeById(Integer id);

    /**
     * 根据用户id获得简历列表
     *
     * @param id 用户id
     * @param status 状态
     * @return 简历列表
     */
    List<Resume> getResumeListByUserId(Integer id, Integer status);

    /**
     * 根据id删除简历
     *
     * @param id id
     * @return success or fail
     */
    int deleteResumeById(Integer id);

    /**
     * 更新resume的状态
     *
     * @param id 编号
     * @param status 状态
     * @return success or fail
     */
    int updateResumeStatus(Integer id, Integer status);

    /**
     * 更新Resume
     *
     * @param resume resume
     * @return success or fail
     */
    int updateResume(Resume resume);

    /**
     * 获得简历列表
     *
     * @param paramMap 查询参数
     * @param pager 分页类
     * @return 列表
     */
    List<Resume> getResumeList(HashMap<String, Object> paramMap, Pager<Resume> pager);

    /**
     * 获得指定数量的简历列表
     *
     * @param limit 数量
     * @return 列表
     */
    List<Resume> getAResumeList(int limit);
}
