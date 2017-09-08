package com.elearning.service;

import java.util.List;

import com.elearning.entity.Teacher;

public interface TeacherService {
	
	public void insertBasicInformation(String ID, String name, String department, String phonenumber);

	public void register(Teacher teacher);
	
	public void modifyPassword(String ID, String password);
	
	public void editInfomation(String ID, String name, String image);
	
	public String getPassword(String ID);
	
	public void delete(String ID);
	
	public Teacher findByID(String ID);

	public List<Teacher> findByName(String name);
	
	public List<Teacher> findAll();
}
