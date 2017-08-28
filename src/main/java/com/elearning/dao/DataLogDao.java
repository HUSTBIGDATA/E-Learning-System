package com.elearning.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.elearning.entity.DataLog;

@Repository(value = "dataLogDao")
public interface DataLogDao {
	
	public void add(DataLog dataLog);
	
	public DataLog findByDownloaderID(String ID);
	
	public void updateDownloadTime(@Param("date") Date date, @Param("downloaderID") String downloaderID);
	
	public void delete(int ID);
	
	public List<DataLog> findAll();
}
