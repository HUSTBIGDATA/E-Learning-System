package com.elearning.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.service.ManagerService;
import com.elearning.service.StudentService;
import com.elearning.service.TeacherService;
import com.elearning.tools.Md5Hash;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("public/login");
	}
	
	@RequestMapping(value = "/loginCheck.html", method = RequestMethod.POST)
	public ModelAndView loginCheck(HttpServletRequest httpServletRequest, LoginCommand loginCommand) {
		
		String ID = loginCommand.getID();
		String password = loginCommand.getPassword();
		
		if(studentService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(studentService.findByID(ID).getPassword())) {
				return new ModelAndView("student/studentIndex");
			}
			else {
				return new ModelAndView("public/login", "error", "用户名或密码错误。");
			}
		}
		else if(teacherService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(teacherService.findByID(ID).getPassword())) {
				return new ModelAndView("teacher/teacherIndex");
			}
			else {
				return new ModelAndView("public/login", "error", "用户名或密码错误。");
			}
		}
		else if(managerService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(managerService.findByID(ID).getPassword())) {
				return new ModelAndView("admin/adminIndex");
			}
			else {
				return new ModelAndView("public/login", "error", "用户名或密码错误。");
			}
		}
		return new ModelAndView("public/login", "error", "用户名或密码错误。");
	}
}
