package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Book_Teacher;

public class BookTeacherDao extends HibernateDaoSupport {
	public void save(Book_Teacher bt) {
		this.getHibernateTemplate().save(bt);
	}
	public void delete(Book_Teacher bt) {
		this.getHibernateTemplate().delete(bt);
	}
	public List<Book_Teacher> findAllBookTeacherByTid(Integer tid){
		return this.getHibernateTemplate().find("from Book_Teacher where tid = ?", tid);
	}
	public Book_Teacher findByBid(Integer bid) {
		String query = "from Book_Teacher where bid = ?";
		List<Book_Teacher> list = this.getHibernateTemplate().find(query, bid);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
