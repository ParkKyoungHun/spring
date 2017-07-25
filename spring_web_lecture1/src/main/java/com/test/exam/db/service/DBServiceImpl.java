package com.test.exam.db.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.exam.common.DataSourceFactory;
import com.test.exam.common.dao.MainDao;
import com.test.exam.common.dto.DataBase;

@Service
public class DBServiceImpl implements DBService {
	
	@Autowired
	private MainDao mainDao;
	@Autowired
	private DataSourceFactory dsf;
	
	public void setDataBase(DataBase db){
		dsf.setDataSource(db);
	}
	
	public void test(DataBase db){
		try {
			SqlSession ss = dsf.getSession(db.getDbName());
			ss.selectList("db.TABLE_SELECT");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertDB(Map paramMap){
		String sqlId = "db.DB_INFO_INSERT";
		return mainDao.insert(sqlId, paramMap);
	}
}
