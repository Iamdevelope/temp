package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.BookTheme;
import com.gl.utils.PageHibernateCallback;

public class BookThemeDao extends HibernateDaoSupport {
	public void update(BookTheme bt) {
		this.getHibernateTemplate().update(bt);
	}
	public void save(BookTheme bt) {
		this.getHibernateTemplate().save(bt);
	}
	public Integer selectBookThemeCount() {
		String query = "Select count(*) from BookTheme";
		List<Long> list = this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<BookTheme> selectBookThemes(Integer startIndex,Integer limit) {
		String query = "from BookTheme";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<BookTheme>(query,null,null,startIndex,limit));
	}
	public BookTheme selectBookThemeById(Integer id) {
		return this.getHibernateTemplate().get(BookTheme.class, id);
	}
}
