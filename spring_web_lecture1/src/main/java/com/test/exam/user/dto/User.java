package com.test.exam.user.dto;

import com.test.exam.common.CommonDTO;

public class User extends CommonDTO{
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String age;
	private String admin;
	private String board_admin;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getBoard_admin() {
		return board_admin;
	}
	public void setBoard_admin(String board_admin) {
		this.board_admin = board_admin;
	}
	
}
