package com.elearning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elearning.dao.ManagerDao;
import com.elearning.entity.Manager;
import com.elearning.service.ManagerService;
import com.elearning.tools.Md5Hash;

@Service(value="managerServiceImpl")
@Transactional
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDao managerDao;
	
	public void insertBasicInformation(String ID, String name) {
		managerDao.insertBasicInformation(ID, name);
	}

	public void register(Manager manager) {
		manager.setPassword(Md5Hash.toMD5(manager.getPassword()));
		managerDao.register(manager);
	}

	public void modifyPassword(String ID, String password) {
		managerDao.modifyPassword(ID, Md5Hash.toMD5(password));
	}

	public void editInfomation(String ID, String name, String image) {
		managerDao.editInfomation(ID, name, image);
	}

	public String getPassword(String ID) {
		return managerDao.getPassword(ID);
	}

	public void delete(String ID) {
		managerDao.delete(ID);
	}

	public Manager findByID(String ID) {
		return managerDao.findByID(ID);
	}

	public List<Manager> findAll() {
		return managerDao.findAll();
	}
	
}
