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

	private HashMap<String, DataSource> map = new HashMap<String, DataSource>();
	private SqlSessionFactoryBean ssf;
	
	public void setDataSource(DataBase db){
		BasicDataSource bds = new BasicDataSource();
		bds.setDriverClassName(db.getDriverName());
		bds.setUrl(db.getUrl());
		bds.setUsername(db.getUserName());
		bds.setPassword(db.getPassword());
		map.put(db.getDbName(), bds);
	}

	private DataSource getDataSource(String dbName){
		return map.get(dbName);
	}
	
	private SqlSessionFactoryBean getSsf(String dbName){
		ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(getDataSource(dbName));
		ssf.setConfigLocation(new ClassPathResource("common/spring/mybatis-config.xml"));
		return ssf;
	}
	
	public SqlSession getSession(String dbName) throws Exception{
		getSsf(dbName);
		return ssf.getObject().openSession();
	}
}
