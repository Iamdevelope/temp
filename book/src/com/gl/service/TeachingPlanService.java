package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.TeachingPlanDao;
import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.model.TeachingPlan;
import com.gl.utils.PageBean;

@Transactional
@SuppressWarnings("all")
public class TeachingPlanService {
	private TeachingPlanDao teachingPlanDao;
	private final Integer limit = 10;

	public TeachingPlanDao getTeachingPlanDao() {
		return teachingPlanDao;
	}

	public void setTeachingPlanDao(TeachingPlanDao teachingPlanDao) {
		this.teachingPlanDao = teachingPlanDao;
	}
	public void save(TeachingPlan tp) {
		teachingPlanDao.save(tp);
	}
	public void update(TeachingPlan tp) {
		teachingPlanDao.update(tp);
	}
	public PageBean<TeachingPlan> findAllTeachingPlanByBookTypeId(Integer bookTypeId,Integer page){
		PageBean<TeachingPlan> pageBean = new PageBean<TeachingPlan>();
		List<TeachingPlan> list = teachingPlanDao.findAllTeachingPlansByBookTypeId(bookTypeId);
		if(list!=null) {
			pageBean.setLimit(limit);
			pageBean.setPage(page);
			pageBean.setTotalCount(list.size());
			if(pageBean.getTotalCount()%limit==0) {
				pageBean.setTotalPage(pageBean.getTotalCount()/limit);
			}else {
				pageBean.setTotalPage((pageBean.getTotalCount()/limit+1));
			}
			Integer startIndex = (page-1)*limit;
			List<TeachingPlan> temp = teachingPlanDao.findAllTeachingPlansByPage(bookTypeId, startIndex, limit);
			pageBean.setList(temp);
		}
		return pageBean;
	}
	public List<TeachingPlan> findAllTeachingPlans(){
		return teachingPlanDao.findAllTeachingPlans();
	}

	public void delete(TeachingPlan teachingPlan) {
		// TODO Auto-generated method stub
		teachingPlanDao.delete(teachingPlan);
	}
	public TeachingPlan findTeachingPlanById(Integer id) {
		return teachingPlanDao.findTeachingPlanById(id);
	}
	public Book findBookByName(String name) {
		System.out.println("传过来的值为："+name);
		if(name!=null||name!="") {
			return teachingPlanDao.findBookByName(name);
		}
		return null;
	}
	public BookType findBookTypeByName(String name) {
		System.out.println("传过来的值为："+name);
		if(name!=null||name!="") {
			return teachingPlanDao.findBookTypeByName(name);			
		}
		else {
			return null;
		}
	}
	public BookTheme findBookThemeByName(String name) {
		System.out.println("传过来的值为："+name);
		if(name!=null||name!="") {
			return teachingPlanDao.findBookThemeByName(name);
		}
		return null;
	}
	public TeachingPlan findTeachingPlanByName(String name) {
		System.out.println("传过来的值为："+name);
		if(name!=null||name!="") {
			return teachingPlanDao.findTeachingPlanByName(name);
		}
		return null;
	}
}
