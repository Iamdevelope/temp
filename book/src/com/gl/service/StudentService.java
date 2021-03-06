package com.gl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.gl.dao.StudentDao;
import com.gl.model.Student;
import com.gl.utils.PageBean;
import com.gl.utils.UUIDUtils;

@Transactional
public class StudentService {
	private final Integer limit = 10;
	private StudentDao studentDao;
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao=studentDao;
	}
	public void save(Student student) {
		student.setCode(UUIDUtils.getUUID());
		studentDao.save(student);
	}
	public Student findStudentByName(String name) {
		return studentDao.findStudentByName(name);
	}
	public Student findStudentByUsername(String username) {
		return studentDao.findStudentByUsername(username);
	}
	public Student findStudentByFatherName(String father_name) {
		return studentDao.findStudentByFatherName(father_name);
	}
	public Student findStudentByMotherName(String mother_name) {
		return studentDao.findStudentByMotherName(mother_name);
	}
	public Student findStudentByFatherNumber(int father_number) {
		return studentDao.findStudentByFatherPhone(father_number);
	}
	public Student findStudentByMotherNumber(int mother_number) {
		return studentDao.findStudentByMotherPhone(mother_number);
	}
	public List<Student> findStudentsBySchool(String school){
		return studentDao.findStudentsBySchool(school);
	}
	public List<Student> findAllStudents(){
		return studentDao.findAllStudents();
	}
	public List<Student> findStudentsBySchoolAndClass(String school,String classType){
		return studentDao.findStudentByKey(classType, school);
	}
	public PageBean<Student> findStudentByPage(int currentPage){
		PageBean<Student> pages=new PageBean<Student>();
		pages.setLimit(limit);
		pages.setPage(currentPage);
		int totalCount=0;
		totalCount=studentDao.selectCount();
		pages.setTotalCount(totalCount);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pages.setTotalPage(totalPage);
		int startIndex=(currentPage-1)*limit;
		List<Student> list=studentDao.findByPage(startIndex, limit);
		pages.setList(list);
		return pages;
	}
	//业务层，根据学生学校及班级查询所有
	public PageBean<Student> findStudentByPage(String school,String class_type, int currentPage){
		PageBean<Student> pages=new PageBean<Student>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=0;//数据库中总学生数
		totalCount=studentDao.selectCount(school,class_type);
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
		List<Student> list=studentDao.findByPage(school,class_type,startIndex, limit);
		//System.out.println("找到了相对应的学生，且这些学生个数为："+list.size());
		pages.setList(list);
		return pages;
	}
	public PageBean<Student> findStudentByPage(String school, int currentPage){
		PageBean<Student> pages=new PageBean<Student>();
		pages.setPage(currentPage);
		pages.setLimit(limit);
		int totalCount=0;//数据库中总学生数
		totalCount=studentDao.selectCount(school);
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
		List<Student> list=studentDao.findByPage(school,startIndex, limit);
		//System.out.println("找到了相对应的学生，且这些学生个数为："+list.size());
		pages.setList(list);
		return pages;
	}
	/*
	 * 通过关键字查找学生用户
	 * */
	public PageBean<Student> selectStudentByKey(String selectKey,String school,String class_type,Integer currentPage){
		PageBean<Student> pageBean=new PageBean<Student>();
		pageBean.setPage(currentPage);
		int totalCount=0;
		List<Student> lists=studentDao.findStudentByKey(selectKey,school,class_type);
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
		pageBean.setList(lists);
		return pageBean;
	}
	
	
	public PageBean<Student> selectStudentByKey(String selectKey,String school,Integer currentPage){
		PageBean<Student> pageBean=new PageBean<Student>();
		pageBean.setPage(currentPage);
		int totalCount=0;
		List<Student> lists=studentDao.findStudentByKey(selectKey,school);
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
		List<Student> temp = new ArrayList();
		for(int index=10*(currentPage-1);index<lists.size()&&index<10*currentPage;index++) {
			temp.add(lists.get(index));
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(temp);
		return pageBean;
	}
	public PageBean<Student> findStudentByKey(String key,Integer page){
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setPage(page);
		int totalCount=0;
		List<Student> temp = studentDao.findStudentByKey(key);
		if(temp==null)
			return null;
		totalCount=temp.size();
		List<Student> lists=studentDao.findStudentByLimit(key, (page-1)*10, limit);
		if(lists==null){
			return null;
		}
		pageBean.setTotalCount(totalCount);
		pageBean.setLimit(limit);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(lists);
		return pageBean;
	}
	public PageBean<Student> selectStudentByKey(String selectKey,Integer currentPage){
		PageBean<Student> pageBean=new PageBean<Student>();
		pageBean.setPage(currentPage);
		int totalCount=0;
		List<Student> lists=studentDao.findStudentByKey(selectKey);
		if(lists==null){
			return null;
		}
		totalCount=lists.size();
		pageBean.setTotalCount(totalCount);
		pageBean.setLimit(limit);
		int totalPage=0;
		if(totalCount%limit==0) {
			totalPage=totalCount/limit;
		}else {
			totalPage=totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		pageBean.setList(lists);
		return pageBean;
	}
	public Student findStudentById(Integer sid) {
		return studentDao.findStudentById(sid);
	}
	public void update(Student student) {
		studentDao.update(student);
	}
}
