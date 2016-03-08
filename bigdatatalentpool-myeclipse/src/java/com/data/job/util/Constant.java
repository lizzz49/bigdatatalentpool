package com.data.job.util;

/**
 * 常量类
 *
 * @author tyee.noprom@qq.com
 * @time 2/5/16 9:17 AM.
 */
public class Constant {

    /** 处理成功 **/
    public static final String DEAL_SUCCESS = "DEAL_SUCCESS";

    /** 删除成功 **/
    public static final String DELETE_SUCCESS = "DELETE_SUCCESS";

    /** 删除失败 **/
    public static final String DELETE_FAIL = "DELETE_FAIL";

    /** 处理失败 **/
    public static final String DEAL_FAIL = "DEAL_FAIL";

    /** 处理异常 **/
    public static final String DEAL_EXCEPTION = "DEAL_EXCEPTION";

    /** Session中存放用户信息的key **/
    public static final String USERINFO = "USERINFO";

    /** 登录类型 **/
    public static final String LOGIN_TYPE = "LOGIN_TYPE";

    /** 登录成功 **/
    public static final String LOGIN_SUCCESS = "LOGIN_SUCCESS";

    /** 登录失败 **/
    public static final String LOGIN_FAIL = "LOGIN_FAIL";

    /** 上传成功 **/
    public static final String UPLOAD_SUCCESS = "UPLOAD_SUCCESS";

    /** 上传失败 **/
    public static final String UPLOAD_FAIL = "UPLOAD_FAIL";

    /** 您还没有登录 **/
    public static final String HAS_NOT_LOGIN = "HAS_NOT_LOGIN";

    /** 您必须登录且已经添加简历基本信息 **/
    public static final String YOU_MUST_LOGIN_AND_ADD_RESUME = "YOU_MUST_LOGIN_AND_ADD_RESUME";

    /** 注册成功 **/
    public static final String REG_SUCCESS = "REG_SUCCESS";

    /** 注册失败 **/
    public static final String REG_FAIL = "REG_FAIL";

    /** 此用户名已存在 **/
    public static final String USERNAME_EXISTS = "USERNAME_EXISTS";

    /** 已存在同样名称的简历 **/
    public static final String RESUME_EXISTS = "RESUME_EXISTS";

    /** 已经存在相同的教育信息 **/
    public static final String EDUCATION_EXISTS = "EDUCATION_EXISTS";

    /** 已经存在相同的工作经历 **/
    public static final String EXPERIENCE_EXISTS = "EXPERIENCE_EXISTS";

    /** 已经存在相同的技能 **/
    public static final String SKILL_EXISTS = "SKILL_EXISTS";

    /** 当前正在添加的Resume **/
    public static final String CURRENT_RESUME = "CURRENT_RESUME";

    /** 基本简历信息 **/
    public static final String BASIC_RESUME = "BASIC_RESUME";

    /** 教育信息列表 **/
    public static final String EDUCATION_LIST = "EDUCATION_LIST";

    /** 工作经验列表 **/
    public static final String EXPERIENCE_LIST = "EXPERIENCE_LIST";

    /** 技能列表 **/
    public static final String SKILL_LIST = "SKILL_LIST";

    /** 添加教育信息完成 **/
    public static final String ADD_EDUCATION_DONE = "ADD_EDUCATION_DONE";

    /** 添加工作经验完成 **/
    public static final String ADD_EXPERIENCE_DONE = "ADD_EXPERIENCE_DONE";

    /** 添加技能完成 **/
    public static final String ADD_SKILL_DONE = "ADD_SKILL_DONE";

    /** 新旧密码不能一致 **/
    public static final String OLD_PWD_AND_NEW_PWD_CANNOT_BE_THE_SAME = "OLD_PWD_AND_NEW_PWD_CANNOT_BE_THE_SAME";

    /** 密码错误 **/
    public static final String PWD_ERROR = "PWD_ERROR";

    /** 简历列表 **/
    public static final String RESUME_LIST = "RESUME_LIST";

    /** 简历数量 **/
    public static final String RESUME_COUNT = "RESUME_COUNT";

    /** 只允许存在一个可以显示的简历 **/
    public static final String ONLY_ONE_RESUME_IS_AVAILABLE = "ONLY_ONE_RESUME_IS_AVAILABLE";

    /** 您已经存在公开显示的简历 **/
    public static final String PUBLIC_RESUME_ALREADY_EXISTS = "PUBLIC_RESUME_ALREADY_EXISTS";

    /** MD5加密HASH **/
    public static final String MD5_HASH = "1qazxsw23ed12345cvf0987r432456%^8&*8%3T1GBB5N6M<*9IK64TY1UIOGHJKVBHI%^&*()_+";

    /** session失效时间 **/
    public static final String SESSION_INVALID_TIME = "SESSION_INVALID_TIME";

    public static final String HOST_URL = "http://localhost:8080/bigdatatalentpool";

    public static void main(String[] args) {
        String str = new String("ef6606b75e04d972715278be7ff9bbf7");
        System.out.println("len = " + str.length());
        return;
    }
}
