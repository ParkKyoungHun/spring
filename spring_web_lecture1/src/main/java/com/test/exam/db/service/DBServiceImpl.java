package com.test.exam.db.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	private SqlSession ss ;
	
	public void setDataBase(DataBase db){
		dsf.setDataSource(db);
	}
	
	public boolean connectDB(DataBase db) throws Exception{
			dsf.setDataSource(db);
			ss = dsf.getSession(db.getDbName());
			return true;
	}
	
	public List getTableList(){
		return ss.selectList("db.TABLE_SELECT");
	}
	public List getDBList(){
		String sqlId = "db.DB_INFO_SELECT";
		return mainDao.getList(sqlId);
	}
	
	public Map getDBInfo(Map paramMap){
		String sqlId = "db.DB_INFO_SELECT";
		return (Map) mainDao.getObject(sqlId, paramMap);
	}
	
	public int insertDB(Map paramMap){
		String sqlId = "db.DB_INFO_INSERT";
		return mainDao.insert(sqlId, paramMap);
	}
}
