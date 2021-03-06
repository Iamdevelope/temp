package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.ManagerDao;
import com.gl.model.Manager;
import com.gl.utils.PageBean;
import com.gl.utils.UUIDUtils;

@Transactional
public class ManagerService {
	private final Integer limit = 10;
	private ManagerDao managerDao;
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao=managerDao;
	}
	public Manager login(Manager manager) {
		return managerDao.login(manager);
	}
	public void update(Manager manager) {
		managerDao.update(manager);
	}
	public void delete(Manager manager) {
		managerDao.delete(manager);
	}
	//业务层查找所有管理员
	public PageBean<Manager> findManagerByPage(int currentPage){
		//System.out.println("当前管理员页面："+currentPage);
		PageBean<Manager> pages=new PageBean<Manager>();
		pages.setPage(currentPage);
		int totalCount=0;
		pages.setLimit(limit);
		totalCount=managerDao.findAllManagerCount();
		//System.out.println("管理员个数："+totalCount);
		pages.setTotalCount(totalCount);
		int totalPages=0;
		if(totalCount%limit==0) {
			totalPages=totalCount/limit;
		}else {
			totalPages=totalCount/limit+1;
		}
		pages.setTotalPage(totalPages);
		//System.out.println("管理员页面共有："+totalPages);
		int startIndex=(currentPage-1)*limit;
		List<Manager> list = managerDao.findManagers(startIndex, limit);
		pages.setList(list);
		return pages;
	}
	public Manager findManangerById(Integer id) {
		return managerDao.findManagerById(id);
	}
	public List<Manager> findAllManagers(){
		return managerDao.findAllManagers();
	}
	public void save(Manager manager) {
		String code=UUIDUtils.getUUID();
		manager.setCode(code);
		managerDao.save(manager);
	}
	public PageBean<Manager> selectManagerByKey(String select, Integer page) {
		PageBean<Manager> pageBean=new PageBean<Manager>();
		pageBean.setPage(page);
		int totalCount=0;
		List<Manager> lists=managerDao.findManagerByKey(select);
		if(lists==null){
			return null;
		}
		totalCount=lists.size();
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(lists);
		return pageBean;
	}
}
