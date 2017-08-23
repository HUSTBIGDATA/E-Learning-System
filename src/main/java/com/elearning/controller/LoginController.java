package com.elearning.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("public/login");
	}
	
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public void loginCheck(HttpServletResponse httpServletResponse, LoginCommand loginCommand) throws IOException {
		
		String ID = loginCommand.getID();
		String password = loginCommand.getPassword();
		String res = "";
		
		if(studentService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(studentService.findByID(ID).getPassword())) {
				res = "student";
			}
			else {
				res = "error";
			}
		}
		else if(teacherService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(teacherService.findByID(ID).getPassword())) {
				res = "teacher";
			}
			else {
				res = "error";
			}
		}
		else if(managerService.findByID(ID) != null) {
			if (Md5Hash.toMD5(password).equals(managerService.findByID(ID).getPassword())) {
				res = "admin";
			}
			else {
				res = "error";
			}
		}
		else {
			res = "noexist";
		}
		httpServletResponse.getWriter().write(res);	
	}
	
	@RequestMapping(value = "/adminIndex/{adminID}.do", method = RequestMethod.GET)
	public ModelAndView adminIndex(@PathVariable("adminID") String ID) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminIndex");
		String adminName = managerService.findByID(ID).getName();
		mv.addObject("adminName", adminName);
		return mv;
	}
}
