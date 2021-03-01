package com.wy.ks.management.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;

@Controller
public class PageSkiper {

    @RequestMapping("/index")
    public String jspIndex(){
        return "index";
    }

    @RequestMapping("/User_main")
    public ModelAndView toUserMain(HttpServletResponse response) {
        return new ModelAndView("User_main");
    }

    @RequestMapping("/Regist_main")
    public ModelAndView toRegist(HttpServletResponse response) {
        return new ModelAndView("Regist_main");
    }
}
