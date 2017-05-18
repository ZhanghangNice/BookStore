package com.zh.bean;

public class UserBean {
	private  Integer  userid;
	private  String   username;   //用户名
	private  String   password;   //用户密码
	private  String   sex;
	private  String   birthday;
	private  String   email;      //邮箱
	private  String   qq;
	private  String   tel;
	private  String   addr;      //地址
	private  Boolean   permission;   //权限
 	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public Boolean getPermission() {
		return permission;
	}
	public void setPermission(Boolean permission) {
		this.permission = permission;
	}

}
