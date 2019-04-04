package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.DeanDao;
import com.gl.model.Dean;
import com.gl.utils.PageBean;
import com.gl.utils.UUIDUtils;

@Transactional
public class DeanService {
	private final Integer limit = 10;
	private DeanDao deanDao;
	public void setDeanDao(DeanDao deanDao) {
		this.deanDao=deanDao;
	}
	public void update(Dean dean) {
		deanDao.update(dean);
	}
	public void save(Dean dean) {
		String code=UUIDUtils.getUUID();
		dean.setCode(code);
		deanDao.save(dean);
	}
	public void delete(Dean dean) {
		deanDao.delete(dean);
	}
	public Dean login(Dean dean) {
		return deanDao.login(dean);
	}
	public PageBean<Dean> findAllDean(int currentPage){
		PageBean<Dean> pages=new PageBean<Dean>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=0;
		totalCount=deanDao.findAllDeanCount();
		pages.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalPage(totalPage);
		int startIndex=(currentPage-1)*limit;
		List<Dean> list = deanDao.findAllDeans(startIndex, limit);
		pages.setList(list);
		return pages;
	}
	public List<Dean> findAllDean(){
		return deanDao.findAllDeans();
	}
	public Dean findDeanById(Integer did) {
		return deanDao.findDeanById(did);
	}
	public PageBean<Dean> selectDeanByKey(String select, Integer page) {
		PageBean<Dean> pageBean=new PageBean<Dean>();
		pageBean.setPage(page);
		int totalCount=0;
		List<Dean> lists=deanDao.findDeanByKey(select);
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
