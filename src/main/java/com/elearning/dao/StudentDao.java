package com.elearning.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.elearning.entity.Student;

@Repository(value="studentDao")
public interface StudentDao {
	
	public void insertBasicInformation(@Param("ID") String ID, @Param("name") String name);
      //只是添加一行注释
	//public void register(@Param("ID") String ID, @Param("password") String password);
	public void register(Student student);
	
	public void modifyPassword(@Param("ID") String ID, @Param("password") String password);
	
	public void editInfomation(@Param("ID") String ID, @Param("name") String name,
			@Param("image") String image, @Param("preferences") String preferences);
	
	public String getPassword(String ID);
	
	public void delete(String ID);
	
	public Student findByID(String ID);
	
	public List<Student> findAll();
}
