package com.gl.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Teacher;
import com.gl.utils.PageHibernateCallback;


public class TeacherDao extends HibernateDaoSupport {
	
	//登录
	public Teacher login(Teacher teacher) {
		String query="from Teacher where name = ? and password = ?";
		List<Teacher> list = this.getHibernateTemplate().find(query, teacher.getName(),teacher.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		String queryByUsername="from Teacher where username = ? and password = ?";
		list = this.getHibernateTemplate().find(queryByUsername, teacher.getUsername(),teacher.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		String queryByPhoneNumber="from Teacher where phone_number = ? and password = ?";
		list = this.getHibernateTemplate().find(queryByPhoneNumber, teacher.getPhone_number(),teacher.getPassword());
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public List<Teacher> findAllTeachers(int startIndex,Object[] params,String[] args,int limit){
		String query="from Teacher";
		List<Teacher> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Teacher>(query,params,args,startIndex,limit));
		return list;
	}
	public List<Teacher> findTeacherByKey(String key){
		String query="from Teacher where name = ?";
		List<Teacher> list = this.getHibernateTemplate().find(query, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByUsername="from Teacher where username = ?";
		list = this.getHibernateTemplate().find(queryByUsername, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByPhoneNumber="from Teacher where phone_number = ?";
		list = this.getHibernateTemplate().find(queryByPhoneNumber, key);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryBySchool="from Teacher where school= ?";
		list = this.getHibernateTemplate().find(queryBySchool, key);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	//找到所有教师个数
	public int findAll() {
		String query = "Select count(*) from Teacher";
		List<Long> list = this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	//获取同一个学校的所有教师
	public List<Teacher> findTeachersBySchool(String school) {
		String query="from Teacher where school = ?";
		List<Teacher> list = this.getHibernateTemplate().find(query,school);
		return list;
	}
	//通过名字获取相应的教师
	public Teacher findTeacherByName(String name) {
		String query="from Teacher where name = ?";
		List<Teacher> list = this.getHibernateTemplate().find(query,name);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public Teacher findTeacherById(Integer id) {
		
		String query="from Teacher where tid = ?";
		List<Teacher> list=this.getHibernateTemplate().find(query, id);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public int selectCount(String school) {
		String query="Select count(*) from Teacher where school = ?";
		List<Long> list = this.getHibernateTemplate().find(query, school);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<Teacher> findByPage(String school,int startIndex,int findCount){
		String query="from Teacher where school = :school";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Teacher>(query,new Object[] {school},new String[] {"school"},startIndex,findCount));
	}
	public List<Teacher> findTeacherByKey(String key,String school) {
		String query="from Teacher where name = ? and school = ?";
		List<Teacher> list = this.getHibernateTemplate().find(query, key,school);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	//更新教师信息
	public void update(Teacher teacher) {
		this.getHibernateTemplate().update(teacher);
	}
	//注册教师
	public void save(Teacher teacher) {
		this.getHibernateTemplate().save(teacher);
	}
	//删除
	public void delete(Teacher teacher) {
		this.getHibernateTemplate().delete(teacher);
	}
}
