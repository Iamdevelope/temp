package com.gl.service;



import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.BookTeacherDao;
import com.gl.model.Book_Teacher;

@Transactional
public class BookTeacherService {
	private BookTeacherDao bookTeacherDao;
	public void setBookTeacherDao(BookTeacherDao bookTeacherDao) {
		this.bookTeacherDao=bookTeacherDao;
	}
	public void save(Book_Teacher bt) {
		bookTeacherDao.save(bt);
	}
	public void delete(Book_Teacher bt) {
		bookTeacherDao.delete(bt);
	}
	public Book_Teacher findByBid(Integer bid) {
		return bookTeacherDao.findByBid(bid);
	}
}
