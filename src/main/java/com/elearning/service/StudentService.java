package com.elearning.service;

import java.util.List;

import com.elearning.entity.Student;

public interface StudentService {
	
	public void insertBasicInformation(String ID, String name, String department, String phonenumber);

	//public void register(String ID, String password);
	public void register(Student student);
	
	public void modifyPassword(String ID, String password);
	
	public void editInfomation(String ID, String name, String image, String preferences);
	
	public String getPassword(String ID);
	
	public void delete(String ID);
	
	public Student findByID(String ID);
	
	public List<Student> findByName(String name);
	
	public List<Student> findAll();
}
