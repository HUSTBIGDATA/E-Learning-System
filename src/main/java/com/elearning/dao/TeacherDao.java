package com.elearning.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.elearning.entity.Teacher;

@Repository(value = "teacherDao")
public interface TeacherDao {
	
	public void insertBasicInformation(@Param("ID") String ID, @Param("name") String name);

	public void register(Teacher manager);
	
	public void modifyPassword(@Param("ID") String ID, @Param("password") String password);
	
	public void editInfomation(@Param("ID") String ID, @Param("name") String name, @Param("image") String image);
	
	public String getPassword(String ID);
	
	public void delete(String ID);
	
	public Teacher findByID(String ID);
	
	public List<Teacher> findAll();
}
