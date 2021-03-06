package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.BookThemeDao;
import com.gl.model.BookTheme;
import com.gl.utils.PageBean;

@Transactional
public class BookThemeService {
	private final Integer limit = 10;
	private BookThemeDao bookThemeDao;

	public BookThemeDao getBookThemeDao() {
		return bookThemeDao;
	}

	public void setBookThemeDao(BookThemeDao bookThemeDao) {
		this.bookThemeDao = bookThemeDao;
	}
	public void update(BookTheme bt) {
		bookThemeDao.update(bt);
	}
	public void save(BookTheme bt) {
		bookThemeDao.save(bt);
	}
	public BookTheme selectBookThemeById(Integer id) {
		return bookThemeDao.selectBookThemeById(id);
	}
	public BookTheme findBookThemeByName(String name) {
		return bookThemeDao.findBookThemeByName(name);
	}
	public PageBean<BookTheme> selectBookThemes(Integer startIndex){
		PageBean<BookTheme> pageBean = new PageBean<BookTheme>();
		int totalCount=bookThemeDao.selectBookThemeCount();
		pageBean.setPage(startIndex);
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		List<BookTheme> lists=bookThemeDao.selectBookThemes(10*(startIndex-1), limit);
		pageBean.setList(lists);
		return pageBean;
	}
	public PageBean<BookTheme> selectBookThemes(String classType,Integer startIndex){
		PageBean<BookTheme> pageBean = new PageBean<BookTheme>();
		int totalCount=bookThemeDao.selectBookThemeCount();
		pageBean.setPage(startIndex);
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		List<BookTheme> lists=bookThemeDao.selectBookThemes(classType,10*(startIndex-1), limit);
		pageBean.setList(lists);
		return pageBean;
	}
	public List<BookTheme> selectBookThemes(String classType){
		List<BookTheme> lists=bookThemeDao.selectBookThemes(classType);
		return lists;
	}

	public void delete(BookTheme bookTheme) {
		// TODO Auto-generated method stub
		bookThemeDao.delete(bookTheme);
	}
}
