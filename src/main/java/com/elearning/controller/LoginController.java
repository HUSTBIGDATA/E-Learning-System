package com.elearning.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String loginCheck(HttpServletResponse httpServletResponse, LoginCommand loginCommand) throws IOException {
		
		String ID = loginCommand.getID();
		String password = loginCommand.getPassword();
		String res = "";
		
	    System.out.println(ID);
		System.out.println(password);
		//String string = managerService.findByID(ID).getID();
		//String string2 = managerService.findByID(ID).getPassword();
		//System.out.println(string);
		//System.out.println(string2);
		//httpServletResponse.getWriter().write("admin");
		/*if(studentService.findByID(ID) != null) {
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
				System.out.println("go");
			}
			else {
				res = "error";
			}
		}
		else {
			res = "noexist";
		}*/
		httpServletResponse.getWriter().write("error");
		return null;
	}
	
	@RequestMapping(value = "/adminIndex.html", method = RequestMethod.GET)
	public ModelAndView adminIndex() {
		return new ModelAndView("admin/adminIndex");
	}
}
