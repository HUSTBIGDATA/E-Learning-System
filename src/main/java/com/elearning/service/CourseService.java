package com.elearning.service;

import java.util.List;

import com.elearning.entity.Course;

public interface CourseService {
	
	public void add(Course course);
	
	public void delete(int ID);
	
	public List<Course> findByTeacher(String teacherID);
	
	public List<Course> findByName(String name);
	
	public List<Course> findAll();
}
