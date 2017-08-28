package com.elearning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elearning.dao.DataDao;
import com.elearning.entity.Data;
import com.elearning.service.DataService;

@Service(value="dataServiceImpl")
@Transactional
public class DataServiceImpl implements DataService {
	
	@Autowired
	private DataDao dataDao;
	
	public void add(Data data) {
		dataDao.add(data);
	}
	
	public List<Data> findByType(String type) {
		return dataDao.findByType(type);
	}

	public List<Data> findAll() {
		return dataDao.findAll();
	}

	public void delete(int ID) {
		dataDao.delete(ID);
	}
}
