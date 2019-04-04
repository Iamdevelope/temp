package com.gl.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.BookTypeDao;
import com.gl.model.BookType;
import com.gl.utils.PageBean;

@Transactional
public class BookTypeService {
	private final Integer limit = 10;
	private BookTypeDao bookTypeDao;

	public BookTypeDao getBookTypeDao() {
		return bookTypeDao;
	}

	public void setBookTypeDao(BookTypeDao bookTypeDao) {
		this.bookTypeDao = bookTypeDao;
	}
	
	public void update(BookType bt) {
		bookTypeDao.update(bt);
	}
	public void save(BookType bt) {
		bookTypeDao.save(bt);
	}
	public BookType selectBookTypeById(Integer id) {
		return bookTypeDao.selectBookTypeById(id);
	}
	public PageBean<BookType> selectBookTypes(Integer startIndex){
		PageBean<BookType> pageBean = new PageBean<BookType>();
		int totalCount=bookTypeDao.selectBookTypeCount();
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
		System.out.println("绘本类型总数量为："+totalCount+"-----绘本总页数："+totalPage);
		List<BookType> list = bookTypeDao.selectBookTypes(limit*(startIndex-1), limit);
		pageBean.setList(list);
		return pageBean;
	}
}
