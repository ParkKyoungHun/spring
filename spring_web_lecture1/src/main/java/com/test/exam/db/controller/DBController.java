package com.test.exam.db.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.exam.common.dto.DataBase;
import com.test.exam.db.service.DBService;

@Controller
public class DBController { 

	@Autowired
	private DBService dbs; 
	@Autowired
	private DataBase db;
	
	@RequestMapping(value="/db/add", method=RequestMethod.POST)
	public @ResponseBody Map insertDB(@RequestBody Map pm, ModelMap model) {
		db.setDbName((String) pm.get("dbname"));
		db.setDriverName((String) pm.get("dbms"));
		db.setUrl((String)pm.get("url"));
		db.setUserName((String)pm.get("id"));
		db.setPassword((String)pm.get("pwd"));
		dbs.setDataBase(db);
		int result = dbs.insertDB(pm);
		model.addAttribute("create", "failed");
		model.put("msg", "create failed");
		if(result==1){
			model.addAttribute("create", "succeed");
			model.put("msg", "create succeed");
		}
		return model;
	}
}
