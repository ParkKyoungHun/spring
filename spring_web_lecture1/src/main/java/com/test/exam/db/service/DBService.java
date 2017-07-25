package com.test.exam.db.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.test.exam.common.dto.DataBase;

@Service
public interface DBService {
	public void setDataBase(DataBase db);
	public int insertDB(Map paramMap);	
	public void test(DataBase db);
	public List getDBList();
}
