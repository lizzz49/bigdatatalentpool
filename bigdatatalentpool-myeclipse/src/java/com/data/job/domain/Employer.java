package com.data.job.domain;

/**
 * 找人者Model
 *
 * @author tyee.noprom@qq.com
 * @time 2/5/16 8:59 AM.
 */
public class Employer {

    private Integer id;//id
    private String username;//用户名
    private String password;//密码
    private String email;//邮箱

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
