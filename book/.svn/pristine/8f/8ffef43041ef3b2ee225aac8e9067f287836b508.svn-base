package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Admin;

public class AdminDao extends HibernateDaoSupport {
	public void update(Admin admin) {
		this.getHibernateTemplate().update(admin);
	}
	public Admin login(Admin admin) {
		String query="from Admin where name = ? and password = ?";
		List<Admin> list=this.getHibernateTemplate().find(query, admin.getName(),admin.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public Admin findAdminById(Integer id) {
		return this.getHibernateTemplate().get(Admin.class, id);
	}
}
