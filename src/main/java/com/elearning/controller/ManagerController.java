package com.elearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.entity.Manager;
import com.elearning.service.ManagerService;
import com.elearning.tools.Md5Hash;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value = "/loginLoad", method = RequestMethod.GET)
	public ModelAndView loginLoad() {
		ModelAndView mv = new ModelAndView();
		Manager manager = new Manager();
		mv.setViewName("login");
		mv.addObject("manager", manager);
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("manager") Manager manager) {
		if(Md5Hash.toMD5(manager.getPassword()) == managerService.getPassword(manager.getID())) {
			return "success";
		}
		else return "fail";
	}
	
	@RequestMapping(value = "/registerLoad", method = RequestMethod.GET)
	public ModelAndView registerLoad() {
		ModelAndView mv = new ModelAndView();
		Manager manager = new Manager();
		mv.setViewName("register");
		mv.addObject("manager", manager);
		return mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("manager") Manager manager) {
		managerService.register(manager);
		return "redirect:/manager/login";
	}
}
