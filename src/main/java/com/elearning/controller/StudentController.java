package com.elearning.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.entity.Student;
import com.elearning.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/loginLoad", method = RequestMethod.GET)
	public ModelAndView loginLoad() {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login() {
		return "redirect:/student/studentList";
	}
	
	@RequestMapping(value = "/studentList")
	public ModelAndView studentList() {
		List<Student> studentList = studentService.findAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("studentList", studentList);
		mv.setViewName("studentList");
		return mv;
	}
	
	/*@RequestMapping(value = "/addLoad", method = RequestMethod.GET)
	public ModelAndView addLoad() {
		ModelAndView mv = new ModelAndView();
		Student student = new Student();
		mv.setViewName("add");
		mv.addObject("student", student);
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("student") Student student) {
		studentService.add(student);	
		return "redirect:/student/studentList";
	}
	
	@RequestMapping(value = "/editLoad",method = RequestMethod.GET)
	public ModelAndView editLoad(@RequestParam(value = "ID") String ID) {
		Student student = studentService.findByID(ID);
		ModelAndView mv = new ModelAndView();
		mv.addObject("student", student);
		mv.setViewName("edit");
		return mv;
	}
	
	@RequestMapping(value = "/edit",method = RequestMethod.POST)
	public String edit(@ModelAttribute("student") Student student) {
		studentService.update(student);
		return "redirect:/student/studentList";
	}
	

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "ID")String ID) {
		studentService.delete(ID);
		return "redirect:/student/studentList";
	}*/
}
