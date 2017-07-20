package com.test.exam.db.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.exam.db.service.DBService;

@Controller
public class DBController { 

	@Autowired
	private DBService dbs; 
	
	@RequestMapping("/db/add")
	public @ResponseBody Map insertDB(@RequestParam Map pm, ModelMap model) {
		int result = dbs.insertDB(pm);
		model.addAttribute("create", "failed");
		if(result==1){
			model.addAttribute("create", "succeed");
		}
		return model;
	}
}
