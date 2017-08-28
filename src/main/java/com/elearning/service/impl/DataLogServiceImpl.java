package com.elearning.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elearning.dao.DataLogDao;
import com.elearning.entity.DataLog;
import com.elearning.service.DataLogService;

@Service(value="dataLogServiceImpl")
@Transactional
public class DataLogServiceImpl implements DataLogService {
	
	@Autowired
	private DataLogDao dataLogDao;

	public void add(DataLog dataLog) {
		dataLogDao.add(dataLog);
	}

	public DataLog findByDownloaderID(String ID) {
		return dataLogDao.findByDownloaderID(ID);
	}

	public void updateDownloadTime(Date date, String downloaderID) {
		dataLogDao.updateDownloadTime(date, downloaderID);
	}

	public void delete(int ID) {
		dataLogDao.delete(ID);
	}

	public List<DataLog> findAll() {
		return dataLogDao.findAll();
	}
}
