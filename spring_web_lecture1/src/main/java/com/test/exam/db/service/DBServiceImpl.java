package com.test.exam.db.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.exam.common.dao.MainDao;

@Service
public class DBServiceImpl implements DBService {
	
	@Autowired
	private MainDao mainDao;
	
	public int insertDB(Map paramMap){
		String sqlId = "db.DB_INFO_INSERT";
		return mainDao.insert(sqlId, paramMap);
	}
}
