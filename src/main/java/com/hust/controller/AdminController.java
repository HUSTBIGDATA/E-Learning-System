package com.hust.controller;

import com.hust.domain.Admin;
import com.hust.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

/**
 * Created by hujunhui on 2017/7/21.
 */
@Controller
//@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminservice;

    @RequestMapping(value = "/index.html")
    public ModelAndView adminList() {

       /*List<Admin> adminlist = adminservice.findAll();

        System.out.println(adminlist);
*/
        Admin adminlist = adminservice.findByID("111");
        ModelAndView mv = new ModelAndView();

        mv.addObject("adminList", adminlist);

        mv.setViewName("adminList");

        // System.out.println("运行到这.......");

        return mv;
    }

    @Autowired
    public void setUserService(AdminService adminService) {
        this.adminservice = adminService;
    }

}
