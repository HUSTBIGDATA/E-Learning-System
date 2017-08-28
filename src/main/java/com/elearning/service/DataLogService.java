package com.elearning.service;

import java.sql.Date;
import java.util.List;

import com.elearning.entity.DataLog;

public interface DataLogService {
	
	public void add(DataLog dataLog);
	
	public DataLog findByDownloaderID(String ID);
	
	public void updateDownloadTime(Date date, String downloaderID);
	
	public void delete(int ID);
	
	public List<DataLog> findAll();
}
