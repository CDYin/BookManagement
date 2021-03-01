package com.wy.ks.management.daoimpl;

import com.wy.ks.management.Bean.User;
import com.wy.ks.management.dao.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDaoImpl {
    @Autowired
    IUserDao iUserDao;

    public boolean hasMatchLogin(String account, String password) {
        return iUserDao.getMatchLogin(account,password)>0;
    }

    public boolean addUser(User user) {
        return iUserDao.addUser(user)>0;
    }
}
