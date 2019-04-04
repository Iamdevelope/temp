package com.gl.dao;


import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.TeacherBook;
import com.gl.utils.PageHibernateCallback;

public class TeacherBookDao extends HibernateDaoSupport {
	public void update(TeacherBook teacherBook) {
		this.getHibernateTemplate().update(teacherBook);
	}
	public void save(TeacherBook teacherBook) {
		this.getHibernateTemplate().save(teacherBook);
	}
	public void delete(TeacherBook teacherBook) {
		this.getHibernateTemplate().delete(teacherBook);
	}
	public List<TeacherBook> findTeacherBooksByTeacherName(String teacherName){
		String query="from Teacherbook where teacher_name = ?";
		return this.getHibernateTemplate().find(query, teacherName);
	}
	public List<TeacherBook> findTeacherBooksByBookName(String bookName){
		String query="from Teacherbook where book_name = ?";
		return this.getHibernateTemplate().find(query, bookName);
	}
	public List<TeacherBook> findTeacherBooksByTid(Integer tid){
		String query = "from Teacherbook where tid = ?";
		return this.getHibernateTemplate().find(query, tid);
	}
	public List<TeacherBook> findTeacherBooksByBid(Integer bid){
		String query = "from Teacherbook where bid = ?";
		return this.getHibernateTemplate().find(query, bid);
	}
	public int findAll() {
		String query="Select count(*) from Teacherbook";
		List<Long> list=this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<TeacherBook> findAll(Integer startIndex,Integer limit){
		return this.getHibernateTemplate().execute(new PageHibernateCallback<TeacherBook>("from Teacherbook",null,null,startIndex,limit));
	}
	/*
	 * 通过教师id获取教案
	 * */
	public List<TeacherBook> findTeacherBooksByTid(Integer tid,Integer startIndex,Integer limit){
		String query="from Teacherbook";
		List<TeacherBook> list = this.getHibernateTemplate().execute(new PageHibernateCallback<TeacherBook>(query,new Object[] {tid},new String[] {"tid"},startIndex,limit));
		return list;
	}
	/*
	 * 通过绘本id获取教案
	 * */
	public List<TeacherBook> findTeacherBooksByBid(Integer bid,Integer startIndex,Integer limit){
		String query="from Teacherbook";
		List<TeacherBook> list = this.getHibernateTemplate().execute(new PageHibernateCallback<TeacherBook>(query,new Object[] {bid},new String[] {"bid"},startIndex,limit));
		return list;
	}
}
