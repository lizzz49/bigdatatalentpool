package com.data.job.mapper;

import com.data.job.domain.Resume;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * ResumeMapper
 *
 * @author tyee.noprom@qq.com
 * @time 2/6/16 2:50 PM.
 */
public interface ResumeMapper {

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
    Resume getResumeByTitle(@Param("title") String title, @Param("id") Integer id);

    /**
     * 根据id获得简历详情
     *
     * @param id
     * @return
     */
    Resume getResumeById(@Param("id") Integer id);

    /**
     * 根据用户id获得简历列表
     *
     * @param id 用户id
     * @param status 状态
     * @return 简历列表
     */
    List<Resume> getResumeListByUserId(@Param("id") Integer id, @Param("status") Integer status);

    /**
     * 根据id删除简历
     *
     * @param id id
     * @return success or fail
     */
    int deleteResumeById(@Param("id") Integer id);

    /**
     * 更新resume的状态
     *
     * @param id 编号
     * @param status 状态
     * @return success or fail
     */
    int updateResumeStatus(@Param("id") Integer id, @Param("status") Integer status);

    /**
     * 更新Resume
     *
     * @param resume resume
     * @return success or fail
     */
    int updateResume(Resume resume);

    /**
     * 获得简历数量
     *
     * @param paramMap 查询参数
     * @return 数量
     */
    int getResumeCount(HashMap<String, Object> paramMap);

    /**
     * 获得简历列表
     *
     * @param paramMap 查询参数
     * @return 列表
     */
    List<Resume> getResumeList(HashMap<String, Object> paramMap);

    /**
     * 获得指定数量的简历列表
     *
     * @param limit 数量
     * @return 列表
     */
    List<Resume> getAResumeList(@Param("limit") int limit);
}
