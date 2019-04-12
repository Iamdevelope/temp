package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.utils.PageHibernateCallback;

public class BookTypeDao extends HibernateDaoSupport {
	public void update(BookType bt) {
		this.getHibernateTemplate().update(bt);
	}
	public void save(BookType bt) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(bt);		
	}
	public Integer selectBookTypeCount() {
		String query = "Select count(*) from BookType";
		List<Long> list = this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<BookType> selectBookTypes(Integer startIndex,Integer limit){
		String query = "from BookType";
		List<BookType> list = this.getHibernateTemplate().execute(new PageHibernateCallback<BookType>(query,null,null,startIndex,limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	public BookType selectBookTypeById(Integer id) {
		return this.getHibernateTemplate().get(BookType.class, id);
	}
	public BookType findBookTypeByName(String name) {
		String query = "from BookType where book_type_name = ?";
		List<BookType> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
