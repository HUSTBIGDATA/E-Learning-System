package com.elearning.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.elearning.entity.Student;
import com.elearning.service.StudentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/studentList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String studentList() {
		List<Student> studentList = studentService.findAll();
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, studentList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/findByName.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findByName(String name) {
		List<Student> studentList = studentService.findByName(name);	
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, studentList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return writer.toString();
	}
	
	@RequestMapping(value = "/deleteStudent.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteStudent(String studentList) {
		String[] studentIDList = studentList.split(",");
		for(int i = 0;i<studentIDList.length;i++) {
			studentService.delete(studentIDList[i]);
		}
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, studentService.findAll());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	/*@RequestMapping(value = "/studentList.html")
	public ModelAndView studentList() {
		List<Student> studentList = studentService.findAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("studentList", studentList);
		mv.setViewName("studentList");
		return mv;
	}*/
	
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
