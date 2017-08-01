package com.hust.service;

import com.hust.domain.Admin;

import java.util.List;

/**
 * Created by hujunhui on 2017/7/21.
 */
public interface AdminService {

    public void add(Admin admin);

    public void update(Admin admin);

    public void delete(String adminName);

    public Admin findByID(String adminName);

    public List<Admin> findAll();
}
