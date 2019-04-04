package com.gl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.TeacherDao;
import com.gl.model.Teacher;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.gl.utils.UUIDUtils;
@Transactional
public class TeacherService {
	private final Integer limit = 10;
	private TeacherDao teacherDao;
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao=teacherDao;
	}
	//业务层查找所有老师
	public PageBean<Teacher> findAllTeachers(Integer currentPage){
		//System.out.println("当前教师页面："+currentPage);
		PageBean<Teacher> list=new PageBean<Teacher>();
		list.setPage(currentPage);
		int totalCount=0;
		list.setLimit(limit);
		totalCount=teacherDao.findAll();
		list.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		list.setTotalPage(totalPage);
		int startIndex=(currentPage-1)*limit;
		List<Teacher> t=teacherDao.findAllTeachers(startIndex,null,null, limit);
		
		//System.out.println("当前教师个数："+t.size());
		list.setList(getCanUser(t));
		//System.out.println("当前教师第一个的名字："+list.getList().get(0).getName());
		return list;
	}
	//查找同一个学校的所有老师
	public List<Teacher> findTeachersBySchool(String school){
		return teacherDao.findTeachersBySchool(school);
	}
	//通过教师名字查找教师用户
	public Teacher findTeacherByName(String name) {
		return teacherDao.findTeacherByName(name);
	}
	//通过教师ID查找教师用户
	public Teacher findTeacherById(Integer id) {
		return teacherDao.findTeacherById(id);
	}
	/*
	 * 通过关键字查找教师用户
	 * */
	public PageBean<Teacher> selectTeacherByKey(String selectKey,Integer currentPage){
		PageBean<Teacher> pageBean=new PageBean<Teacher>();
		pageBean.setPage(currentPage);
		int totalCount=0;
		List<Teacher> lists=teacherDao.findTeacherByKey(selectKey);
		if(lists==null){
			return null;
		}
		totalCount=lists.size();
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(getCanUser(lists));
		return pageBean;
	}
	public PageBean<Teacher> findTeacherByPage(String school, int currentPage){
		PageBean<Teacher> pages=new PageBean<Teacher>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=0;//数据库中总教师数
		totalCount=teacherDao.selectCount(school);
		//System.out.println("满足条件的学生个数："+totalCount);
		int totalPage=0;
		if(totalCount % limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalCount(totalCount);
		pages.setTotalPage(totalPage);
		int startIndex=(currentPage-1)*limit;
		List<Teacher> list=teacherDao.findByPage(school,startIndex, limit);
		//System.out.println("找到了相对应的教师，且这些教师个数为："+list.size());
		pages.setList(getCanUser(list));
		return pages;
	}
	public PageBean<Teacher> selectTeacherByKey(String selectKey,String school,Integer currentPage){
		PageBean<Teacher> pageBean=new PageBean<Teacher>();
		pageBean.setPage(currentPage);
		pageBean.setLimit(limit);
		int totalCount=0;
		List<Teacher> lists=teacherDao.findTeacherByKey(selectKey,school);
		if(lists==null){
			return null;
		}
		totalCount=lists.size();
		pageBean.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(getCanUser(lists));
		return pageBean;
	}
	//登录
	public Teacher login(Teacher teacher) {
		return teacherDao.login(teacher);
	}
	//更新教师用户信息
	public void update(Teacher teacher) {
		teacherDao.update(teacher);
	}
	//教师用户注册
	public void save(Teacher teacher) {
		String code=UUIDUtils.getUUID();
		teacher.setCreate_time(TimeHelper.getCurrentTime());
		teacher.setCode(code);
		teacherDao.save(teacher);
	}
	//删除用户
	public void delete(Teacher teacher) {
		teacherDao.delete(teacher);
	}
	private List<Teacher> getCanUser(List<Teacher> t){
		List<Teacher> temp=new ArrayList<Teacher>();
		for(int i=0;i<t.size();i++) {
			if(t.get(i).getIsdelete()==0) {
				temp.add(t.get(i));
			}
		}
		return t;
	}
}
