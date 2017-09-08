package com.elearning.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.entity.Course;
import com.elearning.entity.Teacher;
import com.elearning.service.CourseService;
import com.elearning.service.TeacherService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value = "/dataScan.do", method = RequestMethod.GET)
	public ModelAndView dataScanLoad() {
		return new ModelAndView("teacher/teacherData");
	}
	
	@RequestMapping(value = "/courseListLoad/{teacherID}.do", method = RequestMethod.GET)
	public ModelAndView courseListLoad(@PathVariable("teacherID") String teacherID) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("teacher/teacherCourse");
		mv.addObject("ID", teacherID);
		return mv;
	}
	
	@RequestMapping(value = "/courseList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String courseList(String teacherID) {
		List<Course> courseList = courseService.findByTeacher(teacherID);
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		for(Course course : courseList) {
			course.setCourseTeacher(teacherService.findByID(course.getCourseTeacher()).getName());
		}
		
		try {
			mapper.writeValue(writer, courseList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/teacherInfo/{teacherID}.do", method = RequestMethod.GET)
	public ModelAndView adminInfoLoad(@PathVariable("teacherID") String ID) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("teacher/teacherInfo");
		mv.addObject("teacherID", ID);
		mv.addObject("teacherName", teacherService.findByID(ID).getName());
		mv.addObject("teacherPhonenumber", teacherService.findByID(ID).getPhonenumber());
		mv.addObject("teacherDepartment", teacherService.findByID(ID).getDepartment());
		return mv;
	}
	
	@RequestMapping(value = "/teacherList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String teacherList() {
		List<Teacher> teacherList = teacherService.findAll();
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();

		try {
			mapper.writeValue(writer, teacherList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/modifyPassword.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyPassword(ModifyPasswordCommand modifyPasswordCommand) {
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		String response = "";
		
		String ID = modifyPasswordCommand.getID();
		String newPassword = modifyPasswordCommand.getNewPassword();
		String oldPassword = modifyPasswordCommand.getOldPassword();
		
		teacherService.modifyPassword(ID, newPassword);	
		if(oldPassword!=teacherService.getPassword(ID)) {
			response = "修改成功!";
		}
		else {
			response = "修改失败!";
		}
		
		try {
			mapper.writeValue(writer, response);
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
		List<Teacher> teacherList = teacherService.findByName(name);	
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, teacherList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return writer.toString();
	}
	
	@RequestMapping(value = "/deleteTeacher.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteTeacher(String teacherList) {
		String[] teacherIDList = teacherList.split(",");
		for(int i = 0;i<teacherIDList.length;i++) {
			teacherService.delete(teacherIDList[i]);
		}
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, teacherService.findAll());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
}
