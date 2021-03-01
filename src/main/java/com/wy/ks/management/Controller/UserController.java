package com.wy.ks.management.Controller;

import com.wy.ks.management.Bean.User;
import com.wy.ks.management.daoimpl.UserDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RestController
public class UserController {

    @Autowired
    UserDaoImpl userDao;

    @RequestMapping(value = "/Login",method = RequestMethod.POST)
    public  Object Login(HttpServletRequest request){
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        boolean isLogin = userDao.hasMatchLogin(account,password);
        HashMap<String,String> res = new HashMap<>();
        if (isLogin){
            res.put("stateCode","2");
            res.put("msg","用户登录成功");
        }
        return res;
    }
    @RequestMapping(value = "/Regist",method = RequestMethod.POST)
    public Object Regist(HttpServletRequest request, @ModelAttribute User user){
        user.setAccount(request.getParameter("account"));
        user.setPassword(request.getParameter("password"));
        boolean success = userDao.addUser(user);
        return success;
    }
}
