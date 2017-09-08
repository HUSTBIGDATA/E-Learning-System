package com.elearning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elearning.dao.StudentDao;
import com.elearning.entity.Student;
import com.elearning.service.StudentService;
import com.elearning.tools.Md5Hash;

@Service(value="studentServiceImpl")
@Transactional
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao studentDao;

	public void insertBasicInformation(String ID, String name, String department, String phonenumber) {
		studentDao.insertBasicInformation(ID, name, department, phonenumber);
	}

	/*public void register(String ID, String password) {
		studentDao.register(ID, Md5Hash.toMD5(password));
	}*/
	public void register(Student student) {
		student.setPassword(Md5Hash.toMD5(student.getPassword()));
		studentDao.register(student);
	}

	public void modifyPassword(String ID, String password) {
		studentDao.modifyPassword(ID, Md5Hash.toMD5(password));
	}

	public void editInfomation(String ID, String name, String image, String preferences) {
		studentDao.editInfomation(ID, name, image, preferences);
	}
	
	public String getPassword(String ID)
	{
		return studentDao.getPassword(ID);
	}

	public void delete(String ID) {
		studentDao.delete(ID);
	}

	public Student findByID(String ID) {
		return studentDao.findByID(ID);
	}
	
	public List<Student> findByName(String name) {
		return studentDao.findByName(name);
	}

	public List<Student> findAll() {
		return studentDao.findAll();
	}	
}
