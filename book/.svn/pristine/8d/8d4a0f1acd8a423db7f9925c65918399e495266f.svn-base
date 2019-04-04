package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Dean;
import com.gl.utils.PageHibernateCallback;

public class DeanDao extends HibernateDaoSupport {
	public void update(Dean dean) {
		this.getHibernateTemplate().update(dean);
	}
	public void delete(Dean dean) {
		this.getHibernateTemplate().delete(dean);
	}
	public void save(Dean dean) {
		this.getHibernateTemplate().save(dean);
	}
	public Dean findDeanByName(String name) {
		String query="from Dean where name = ?";
		List<Dean> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	//登录
	public Dean login(Dean dean) {
		System.out.println("院长的姓名："+dean.getName()+"***院长的密码:"+dean.getPassword()+"****院长的用户名："+dean.getUsername());
		String query="from Dean where name = ? and password = ?";
		List<Dean> list1 = this.getHibernateTemplate().find(query, dean.getName(),dean.getPassword());
		if(list1!=null&&list1.size()>0) {
			return list1.get(0);
		}
		String queryByUsername="from Dean where username = ? and password = ?";
		list1 = this.getHibernateTemplate().find(queryByUsername, dean.getUsername(),dean.getPassword());
		if(list1!=null&&list1.size()>0) {
			return list1.get(0);
		}
		String queryByPhoneNumber="from Dean where phone_number = ? and password = ?";
		list1 = this.getHibernateTemplate().find(queryByPhoneNumber, dean.getPhone_number(),dean.getPassword());
		if(list1!=null&&list1.size()>0) {
			return list1.get(0);
		}
		return null;
	}
	public int findAllDeanCount() {
		String query="Select count(*) from Dean";
		List<Long> list=this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<Dean> findDeansBySchool(String school){
		String query="from Dean where school = ?";
		return this.getHibernateTemplate().find(query,school);
	}
	public List<Dean> findAllDeans(int startIndex,int limit){
		String query="from Dean";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Dean>(query,null,null,startIndex,limit));
	}
	public List<Dean> findAllDeans(){
		String query="from Dean";
		return this.getHibernateTemplate().find(query);
	}
	public Dean findDeanById(Integer did) {
		return this.getHibernateTemplate().get(Dean.class, did);
	}
	public List<Dean> findDeanByKey(String select) {
		String query="from Dean where school = ?";
		List<Dean> list = this.getHibernateTemplate().find(query,select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByName="from Dean where name = ?";
		list = this.getHibernateTemplate().find(queryByName,select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByUsername="from Dean where username = ?";
		list=this.getHibernateTemplate().find(queryByUsername, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByNumber="from Dean where phone_number = ?";
		list=this.getHibernateTemplate().find(queryByNumber, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
}
