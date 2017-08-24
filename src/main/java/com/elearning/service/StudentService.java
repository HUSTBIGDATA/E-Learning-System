package com.elearning.service;

import com.elearning.entity.Student;

import java.util.List;

public interface StudentService {

    public void insertBasicInformation(String ID, String name);

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
