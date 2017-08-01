package com.hust.dao;

import com.hust.domain.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hujunhui on 2017/7/21.
 */
@Repository(value = "adminDao")
public interface AdminDao {

    void add(Admin admin);

    void update(Admin admin);

    void delete(String adminName);

    Admin findByID(String adminName);

    List<Admin> findAll();

}
