package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Manager;
import com.gl.utils.PageHibernateCallback;

@SuppressWarnings("all")
public class ManagerDao extends HibernateDaoSupport {
	public Manager login(Manager manager) {
		//System.out.println("this is current user of name : "+manager.getName()+" and password : "+manager.getPassword()+" from ManagerDao");
		String query="from Manager where name = ? and password =?";
		List<Manager> list=this.getHibernateTemplate().find(query,manager.getName(),manager.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		String q2="from Manager where phone_number = ? and password =?";
		list=this.getHibernateTemplate().find(q2, manager.getName(),manager.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		String q3="from Manager where username= ? and password = ?";
		list=this.getHibernateTemplate().find(q3, manager.getUsername(),manager.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public void update(Manager manager) {
		this.getHibernateTemplate().update(manager);
	}
	//删除管理员
	public void delete(Manager manager) {
		this.getHibernateTemplate().delete(manager);
	}
	//获取所有管理员个数
	public int findAllManagerCount() {
		String query="Select count(*) from Manager";
		List<Long> list=this.getHibernateTemplate().find(query);
		//System.out.println("数据库中共有："+list.get(0).intValue()+"个管理员。");
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<Manager> findAllManagers(){
		String query="from Manager";
		return this.getHibernateTemplate().find(query);
	}
	public List<Manager> findManagers(int startIndex,int limit){
		String query="from Manager";
		List<Manager> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Manager>(query,null,null,startIndex,limit));
		return list;
	}
	public Manager findManagerByName(String name) {
		String query="from Manager where name = ?";
		List<Manager> list = this.getHibernateTemplate().find(query,name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public Manager findManagerById(Integer id) {
		return this.getHibernateTemplate().get(Manager.class, id);
	}
	public void save(Manager manager) {
		this.getHibernateTemplate().save(manager);
	}
	public List<Manager> findManagerByKey(String select) {
		String query="from Manager where name = ?";
		List<Manager> list = this.getHibernateTemplate().find(query,select);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByUsername="from Manager where username = ?";
		list=this.getHibernateTemplate().find(queryByUsername,select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByNumber="from Manager where phone_number = ?";
		list=this.getHibernateTemplate().find(queryByNumber, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByPower="from Manager where power = ?";
		list=this.getHibernateTemplate().find(queryByPower, select);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
}
