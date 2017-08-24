package com.elearning.service;

import com.elearning.entity.Teacher;

import java.util.List;

public interface TeacherService {

    public void insertBasicInformation(String ID, String name);

    public void register(Teacher teacher);

    public void modifyPassword(String ID, String password);

    public void editInfomation(String ID, String name, String image);

    public String getPassword(String ID);

    public void delete(String ID);

    public Teacher findByID(String ID);

    public List<Teacher> findAll();
}
