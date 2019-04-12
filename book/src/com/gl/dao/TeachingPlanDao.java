package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Book;
import com.gl.model.BookTheme;
import com.gl.model.BookType;
import com.gl.model.TeachingPlan;
import com.gl.utils.PageHibernateCallback;

@SuppressWarnings("all")
public class TeachingPlanDao extends HibernateDaoSupport {
	public void save(TeachingPlan tp) {
		this.getHibernateTemplate().save(tp);
	}
	public void update(TeachingPlan tp) {
		this.getHibernateTemplate().update(tp);
	}
	public void delete(TeachingPlan tp) {
		this.getHibernateTemplate().delete(tp);
	}
	public List<TeachingPlan> findAllTeachingPlansByBookTypeId(Integer bookTypeId){
		String query = "from TeachingPlan where idbooktype = ?";
		List<TeachingPlan> list = this.getHibernateTemplate().find(query, bookTypeId);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	public List<TeachingPlan> findAllTeachingPlansByPage(Integer bookTypeId,Integer startIndex,Integer limit){
		String query = "from TeachingPlan where idbooktype = :idbooktype";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<TeachingPlan>(query,
				new Object[] {bookTypeId},new String[] {"idbooktype"},startIndex,limit));
	}
	public TeachingPlan findTeachingPlanById(Integer id) {
		return this.getHibernateTemplate().get(TeachingPlan.class, id);
	}
	public TeachingPlan findTeachingPlanByName(String name) {
		String query = "from TeachingPlan where teaching_plan_name = ?";
		
		List<TeachingPlan> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public Book findBookByName(String name) {
		String query = "from Book where name = ?";
		List<Book> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public BookType findBookTypeByName(String bookTypeName) {
		String query = "from BookType where book_type_name = ?";
		List<BookType> list = this.getHibernateTemplate().find(query, bookTypeName);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public BookTheme findBookThemeByName(String name) {
		String query = "from BookTheme where theme_name = ?";
		List<BookTheme> list = this.getHibernateTemplate().find(query, name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public List<TeachingPlan> findAllTeachingPlans(){
		String query = "from TeachingPlan";
		List<TeachingPlan> list = this.getHibernateTemplate().find(query);
		return list;
	}
}
