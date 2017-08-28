package com.elearning.service;

import java.util.List;

import com.elearning.entity.Data;

public interface DataService {
	
	public void add(Data data);
	
	public List<Data> findByType(String type);
	
	public List<Data> findAll();
	
	public void delete(int ID);
}
