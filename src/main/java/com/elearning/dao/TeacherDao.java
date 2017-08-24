package com.elearning.dao;

import com.elearning.entity.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

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
