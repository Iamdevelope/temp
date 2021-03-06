package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.SoftwareCodeDao;
import com.gl.model.Dean;
import com.gl.model.SoftwareCode;
import com.gl.utils.PageBean;

@Transactional
public class SoftwareCodeService {
	private final Integer limit = 10;
	private SoftwareCodeDao softwareCodeDao;

	public SoftwareCodeDao getSoftwareCodeDao() {
		return softwareCodeDao;
	}

	public void setSoftwareCodeDao(SoftwareCodeDao softwareCodeDao) {
		this.softwareCodeDao = softwareCodeDao;
	}
	public Dean findDeanByName(String name) {
		return softwareCodeDao.findDeanByName(name);
	}
	public void save(SoftwareCode sw) {
		softwareCodeDao.save(sw);
	}
	public void delete(SoftwareCode sw) {
		softwareCodeDao.delete(sw);
	}
	public void update(SoftwareCode sw) {
		softwareCodeDao.update(sw);
	}
	public SoftwareCode findSoftwareById(Integer id) {
		return softwareCodeDao.findCodeBySoftwareId(id);
	}
	public SoftwareCode findCodeByComputerCode(String code,Integer did) {
		return softwareCodeDao.findCodeByComputerCode(code,did);
	}
	public PageBean<SoftwareCode> findAllCode(Integer page){
		PageBean<SoftwareCode> pageBean = new PageBean<SoftwareCode>();
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		List<SoftwareCode> list = softwareCodeDao.findAllCode();
		pageBean.setTotalCount(list.size());
		Integer totalPage = 0;
		if(list.size()%limit==0) {
			totalPage=list.size()/limit;
		}else {
			totalPage=list.size()/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		Integer startIndex = (page-1)*limit;
		List<SoftwareCode> li = softwareCodeDao.findAllCode(startIndex, limit);
		pageBean.setList(li);
		return pageBean;
	}
	public PageBean<SoftwareCode> findCodeByDid(Integer page,Integer did){
		PageBean<SoftwareCode> pageBean = new PageBean<SoftwareCode>();
		pageBean.setLimit(limit);
		pageBean.setPage(page);
		Integer totalCount = softwareCodeDao.findCodeByDid(did).size();
		pageBean.setTotalCount(totalCount);
		if(totalCount%limit==0) {
			pageBean.setTotalPage(totalCount/limit);
		}else {
			pageBean.setTotalPage(totalCount/limit+1);
		}
		Integer startIndex = (page-1)*limit;
		List<SoftwareCode> li = softwareCodeDao.findAllCodeByDid(did, startIndex, limit);
		pageBean.setList(li);
		return pageBean;
	}
}
