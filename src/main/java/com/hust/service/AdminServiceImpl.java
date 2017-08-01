package com.hust.service;

import com.hust.dao.AdminDao;
import com.hust.domain.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by hujunhui on 2017/7/21.
 */
@Service(value = "adminService")
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao admindao;

    public void add(Admin admin) {
        admindao.add(admin);
    }

    public void update(Admin admin) {
        admindao.update(admin);
    }

    public void delete(String adminName) {
        admindao.delete(adminName);
    }

    public Admin findByID(String adminName) {
        return admindao.findByID(adminName);
    }

    public List<Admin> findAll() {
        return admindao.findAll();
    }
}
