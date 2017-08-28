package com.elearning.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.elearning.entity.Data;

@Repository(value = "dataDao")
public interface DataDao {
	
	public void add(Data data);
	
	public List<Data> findByType(String type);
	
	public List<Data> findAll();
	
	public void delete(int ID);
}
