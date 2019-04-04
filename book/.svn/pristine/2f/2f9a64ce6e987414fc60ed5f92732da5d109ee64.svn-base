package com.gl.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Dean extends User {
	private Integer did;
	private String name;
	private String password;
	private String username;
	private String phone_number;
	private String school;
	private String create_time;
	private String last_login_time;
	private Integer login_count=0;
	private String email;
	private Integer can_regist_count=10;	//院长可以注册的老师账号个数
	private Integer registed_count=0;		//当前已经注册了多少个老师账号
	private String area;
	private Integer isdelete=0;	//该角色是否删除，即是否还可以正常使用，0表示可以使用，1表示被删除，不再使用
	private String code;
	private Integer sex;
	private Integer login_state=0;//登录状态
	//private Integer mid;//该院长账号由哪个管理员创建
	private Set<Teacher> teacher=new HashSet<Teacher>();
	private Set<SoftwareCode> softwareCode=new HashSet<SoftwareCode>();
	//用户的外键对象
	private Manager manager;
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(String last_login_time) {
		this.last_login_time = last_login_time;
	}
	public Integer getLogin_count() {
		return login_count;
	}
	public void setLogin_count(Integer login_count) {
		this.login_count = login_count;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getCan_regist_count() {
		return can_regist_count;
	}
	public void setCan_regist_count(Integer can_regist_count) {
		this.can_regist_count = can_regist_count;
	}
	public Integer getRegisted_count() {
		return registed_count;
	}
	public void setRegisted_count(Integer registed_count) {
		this.registed_count = registed_count;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Integer getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}
//	public Integer getMid() {
//		return mid;
//	}
//	public void setMid(Integer mid) {
//		this.mid = mid;
//	}
	public Set<Teacher> getTeacher() {
		return teacher;
	}
	public void setTeacher(Set<Teacher> teacher) {
		this.teacher = teacher;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getLogin_state() {
		return login_state;
	}
	public void setLogin_state(Integer login_state) {
		this.login_state = login_state;
	}
	public Set<SoftwareCode> getSoftwareCode() {
		return softwareCode;
	}
	public void setSoftwareCode(Set<SoftwareCode> softwareCode) {
		this.softwareCode = softwareCode;
	}
	
}
