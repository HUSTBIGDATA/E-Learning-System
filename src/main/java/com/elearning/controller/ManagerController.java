package com.elearning.controller;

import com.elearning.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping(value = "/studentImport.do", method = RequestMethod.GET)
    public ModelAndView studentImportLoad() {
        return new ModelAndView("admin/studentImport");
    }

    @RequestMapping(value = "/studentScan.do", method = RequestMethod.GET)
    public ModelAndView studentScanLoad() {
        return new ModelAndView("admin/studentScan");
    }

    @RequestMapping(value = "/adminInfo.do", method = RequestMethod.GET)
    public ModelAndView adminInfoLoad() {
        return new ModelAndView("admin/adminInfo");
    }
}
