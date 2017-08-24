package com.elearning.service;

import com.elearning.entity.Manager;

import java.util.List;

public interface ManagerService {
    public void insertBasicInformation(String ID, String name);

    public void register(Manager manager);

    public void modifyPassword(String ID, String password);

    public void editInfomation(String ID, String name, String image);

    public String getPassword(String ID);

    public void delete(String ID);

    public Manager findByID(String ID);

    public List<Manager> findAll();
}
