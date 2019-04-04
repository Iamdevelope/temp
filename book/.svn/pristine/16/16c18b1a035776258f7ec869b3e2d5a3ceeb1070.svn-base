package com.gl.service;



import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.AdminDao;
import com.gl.model.Admin;

@Transactional
public class AdminService {
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao=adminDao;
	}
	public Admin login(Admin admin) {
		return adminDao.login(admin);
	}
	public void update(Admin admin) {
		adminDao.update(admin);
	}
	public Admin findAdminById(Integer id) {
		return adminDao.findAdminById(id);
	}
}
