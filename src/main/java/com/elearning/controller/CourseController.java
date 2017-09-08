package com.elearning.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.elearning.entity.Course;
import com.elearning.service.CourseService;
import com.elearning.service.TeacherService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value = "/courseList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String courseList() {
		List<Course> courseList = courseService.findAll();
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
	
	
	@RequestMapping(value = "/add.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(AddCourseCommand addCourseCommand) {
		
		if(teacherService.findByID(addCourseCommand.getCourseTeacher()) == null) {
		}
		
		Course course = new Course();
		course.setCourseName(addCourseCommand.getCourseName());
		course.setCourseTeacher(addCourseCommand.getCourseTeacher());
		course.setPlan(addCourseCommand.getPlan());
		course.setCourseInfo(addCourseCommand.getCourseInfo());
		courseService.add(course);
		
		List<Course> courseList = courseService.findAll();
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		for(Course course2 : courseList) {
			course2.setCourseTeacher(teacherService.findByID(course2.getCourseTeacher()).getName());
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
	
	@RequestMapping(value = "/findByName.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findByName(String name) {
		List<Course> courseList = courseService.findByName(name);	
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
	
	@RequestMapping(value = "/deleteCourse.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteCourse(String courseList) {
		String[] courseIDList = courseList.split(",");
		for(int i = 0;i<courseIDList.length;i++) {
			courseService.delete(Integer.parseInt(courseIDList[i]));
		}
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		List<Course> courselist = courseService.findAll();	
		
		for(Course course : courselist) {
			course.setCourseTeacher(teacherService.findByID(course.getCourseTeacher()).getName());
		}
		
		try {
			mapper.writeValue(writer, courselist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
}
