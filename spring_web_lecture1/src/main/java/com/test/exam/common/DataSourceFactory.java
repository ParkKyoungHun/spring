package com.test.exam.common;

import java.util.HashMap;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.test.exam.common.dto.DataBase;

@Service
public class DataSourceFactory{

	private HashMap<String, DataSource> dsMap = new HashMap<String, DataSource>();
	private HashMap<String, SqlSession> ssMap = new HashMap<String, SqlSession>();
	
	public void setDataSource(DataBase db){
		BasicDataSource bds = new BasicDataSource();
		bds.setDriverClassName(db.getDriverName());
		bds.setUrl(db.getUrl());
		bds.setUsername(db.getUserName());
		bds.setPassword(db.getPassword());
		dsMap.put(db.getDbName(), bds);
	}

	private DataSource getDataSource(String dbName){
		return dsMap.get(dbName);
	}
	
	private SqlSessionFactoryBean getSsf(String dbName){
		SqlSessionFactoryBean ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(getDataSource(dbName));
		ssf.setConfigLocation(new ClassPathResource("common/spring/mybatis-config.xml"));
		return ssf;
	}
	
	public SqlSession getSession(String dbName) throws Exception{
		if(!ssMap.containsKey(dbName)){
			SqlSessionFactoryBean ssf = getSsf(dbName);
			ssMap.put(dbName, ssf.getObject().openSession());
		}
		return ssMap.get(dbName);
	}
}
