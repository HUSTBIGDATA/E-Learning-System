package com.elearning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elearning.dao.CourseDao;
import com.elearning.entity.Course;
import com.elearning.service.CourseService;

@Service(value="courseServiceImpl")
@Transactional
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	public void add(Course course) {
		courseDao.add(course);
	}

	public void delete(int ID) {
		courseDao.delete(ID);
	}
	
	public List<Course> findByTeacher(String teacherID) {
		return courseDao.findByTeacher(teacherID);
	}

	public List<Course> findByName(String name) {
		return courseDao.findByName(name);
	}

	public List<Course> findAll() {
		return courseDao.findAll();
	}
}
