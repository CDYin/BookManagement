package com.wy.ks.management.dao;

import com.wy.ks.management.Bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IUserDao {
    private JdbcTemplate jdbcTemplate;
    private final String LOGIN_MATCT_SQL = "select count(*) from user where account = ? and password = ?";
    private final String USER_REGIST = "INSERT INTO user VALUES(?,?)";
    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int getMatchLogin(String account, String password) {
        return jdbcTemplate.queryForObject(LOGIN_MATCT_SQL,new Object[]{account,password},Integer.class);
    }

    public int addUser(User user) {
        String account = user.getAccount();
        String password = user.getPassword();
        return jdbcTemplate.update(USER_REGIST,new Object[]{account,password});
    }
}
