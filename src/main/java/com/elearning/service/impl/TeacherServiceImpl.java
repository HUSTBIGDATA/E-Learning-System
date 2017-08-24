package com.elearning.service.impl;

import com.elearning.dao.TeacherDao;
import com.elearning.entity.Teacher;
import com.elearning.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(value = "teacherServiceImpl")
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    public void insertBasicInformation(String ID, String name) {
        teacherDao.insertBasicInformation(ID, name);
    }

    public void register(Teacher teacher) {
        teacherDao.register(teacher);
    }

    public void modifyPassword(String ID, String password) {
        teacherDao.modifyPassword(ID, password);
    }

    public void editInfomation(String ID, String name, String image) {
        teacherDao.editInfomation(ID, name, image);
    }

    public String getPassword(String ID) {
        return teacherDao.getPassword(ID);
    }

    public void delete(String ID) {
        teacherDao.delete(ID);
    }

    public Teacher findByID(String ID) {
        return teacherDao.findByID(ID);
    }

    public List<Teacher> findAll() {
        return teacherDao.findAll();
    }

}
