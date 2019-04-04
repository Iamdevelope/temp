package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.TeacherBookDao;
import com.gl.model.TeacherBook;
import com.gl.utils.PageBean;

/*
 * 绘本评价业务层
 * */
@Transactional
public class TeacherBookService {
	private final Integer limit = 10;
	private TeacherBookDao teacherBookDao;
	public void setTeacherBookDao(TeacherBookDao teacherBookDao) {
		this.teacherBookDao=teacherBookDao;
	}
	public void update(TeacherBook teacherBook) {
		teacherBookDao.update(teacherBook);
	}
	public void save(TeacherBook teacherBook) {
		teacherBookDao.save(teacherBook);
	}
	public void delete(TeacherBook teacherBook) {
		teacherBookDao.delete(teacherBook);
	}
	public PageBean<TeacherBook> findAll(Integer currentPage){
		PageBean<TeacherBook> pages=new PageBean<TeacherBook>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=teacherBookDao.findAll();
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalCount(totalCount);
		pages.setTotalPage(totalPage);
		int startIndex=(currentPage-1)*limit;
		List<TeacherBook> list=teacherBookDao.findAll(startIndex, limit);
		pages.setList(list);
		return pages;
	}
	/*
	 * 通过教师id获取到该教师所有的教案
	 * */
	public PageBean<TeacherBook> findTeacherBooksByTid(Integer tid,Integer page){
		PageBean<TeacherBook> pages = new PageBean<TeacherBook>();
		pages.setPage(page);
		pages.setLimit(limit);
		List<TeacherBook> list = teacherBookDao.findTeacherBooksByTid(tid);
		int totalCount=list.size();
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalCount(totalCount);
		pages.setTotalPage(totalPage);
		int startIndex=(page-1)*limit;
		List<TeacherBook> temp = teacherBookDao.findTeacherBooksByTid(tid, startIndex, limit);
		pages.setList(temp);
		return pages;
	}
	/*
	 * 通过绘本id获取到所有教案
	 * */
	public PageBean<TeacherBook> findTeacherBooksByBid(Integer bid,Integer page){
		PageBean<TeacherBook> pages = new PageBean<TeacherBook>();
		pages.setPage(page);
		pages.setLimit(limit);
		List<TeacherBook> list = teacherBookDao.findTeacherBooksByBid(bid);
		int totalCount=list.size();
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalCount(totalCount);
		pages.setTotalPage(totalPage);
		int startIndex=(page-1)*limit;
		List<TeacherBook> temp = teacherBookDao.findTeacherBooksByBid(bid, startIndex, limit);
		pages.setList(temp);
		return pages;
	}
}
