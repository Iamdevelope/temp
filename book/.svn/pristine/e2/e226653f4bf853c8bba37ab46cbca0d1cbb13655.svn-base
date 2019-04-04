package com.gl.dao;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gl.model.Student;
import com.gl.utils.PageHibernateCallback;

public class StudentDao extends HibernateDaoSupport {
	public void save(Student student) {
		this.getHibernateTemplate().save(student);
	}
	public void update(Student student) {
		this.getHibernateTemplate().update(student);
	}
	public int selectCount() {
		String query="Select count(*) from Student";
		List<Long> list = this.getHibernateTemplate().find(query);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	//获取对应学校对应班级的学生数量
	public int selectCount(String school,String class_type) {
		String query="Select count(*) from Student where school = ? and class_type =?";
		List<Long> list = this.getHibernateTemplate().find(query, school,class_type);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	//获取对应学校对应班级的学生数量
	public int selectCount(String school) {
		String query="Select count(*) from Student where school = ?";
		List<Long> list = this.getHibernateTemplate().find(query, school);
		if(list!=null&&list.size()>0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	//通过名字查找学生
	public Student findStudentByName(String name) {
		String query = "from Student where name = ?";
		return findStudentBy(query,name);
	}
	//通过学生父亲姓名查找学生
	public Student findStudentByFatherName(String father_name) {
		String query = "from Student where father_name = ?";
		return findStudentBy(query,father_name);
	}
	//通过学生母亲名字查找学生
	public Student findStudentByMotherName(String mother_name) {
		String query = "from Student where mother_name = ?";
		return findStudentBy(query,mother_name);
	}
	//通过学生父亲电话查找学生
	public Student findStudentByFatherPhone(int father_number) {
		String query = "from Student where father_number = ?";
		return findStudentBy(query,father_number);
	}
	//通过学生母亲电话查找学生
	public Student findStudentByMotherPhone(int mother_number) {
		String query = "from Student where mother_numer = ?";
		return findStudentBy(query,mother_number);
	}
	//通过学生用户名查找学生
	public Student findStudentByUsername(String username) {
		String query = "from Student where username = ?";
		return findStudentBy(query,username);
	}
	//查找同一所学生的所有学生
	public List<Student> findStudentsBySchool(String school) {
		String query = "from Student where school = ?";
		return this.getHibernateTemplate().find(query,school);
	}
	//查找指定页面的学生
	public List<Student> findByPage(int startIndex,int findCount){
		String query = "from Student";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Student>(query,null,null,startIndex,findCount));
	}
	public List<Student> findByPage(String school,int startIndex,int findCount){
		String query="from Student where school = :school";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Student>(query,new Object[] {school},new String[] {"school"},startIndex,findCount));
	}
	public List<Student> findByPage(String school,String class_type,int startIndex,int findCount){
		String query="from Student where school = :school and class_type = :class_type";
		return this.getHibernateTemplate().execute(new PageHibernateCallback<Student>(query,new Object[] {school,class_type},new String[] {"school","class_type"},startIndex,findCount));
	}
	public Student findStudentById(Integer id) {
		return this.getHibernateTemplate().get(Student.class, id);
	}
	private Student findStudentBy(String query,Object object) {
		List<Student> list = this.getHibernateTemplate().find(query, object);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public List<Student> findStudentByKey(String key,String school,String class_type) {
		String query="from Student where name = ? and school = ? and class_type = ?";
		List<Student> list = this.getHibernateTemplate().find(query, key,school,class_type);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFathername="from Student where father_name = ? and school = ? and class_type = ?";
		list = this.getHibernateTemplate().find(queryByFathername, key,school,class_type);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFatherNumber="from Student where father_number = ? and school = ? and class_type = ?";
		list = this.getHibernateTemplate().find(queryByFatherNumber, key,school,class_type);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByMothername="from Student where mother_name = ? and school = ? and class_type = ?";
		list = this.getHibernateTemplate().find(queryByMothername, key,school,class_type);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByMotherNumber="from Student where mother_number = ? and school = ? and class_type = ?";
		list = this.getHibernateTemplate().find(queryByMotherNumber, key,school,class_type);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	public List<Student> findStudentByKey(String key,String school) {
		String query="from Student where name = ? and school = ?";
		List<Student> list = this.getHibernateTemplate().find(query, key,school);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFathername="from Student where father_name = ? and school = ?";
		list = this.getHibernateTemplate().find(queryByFathername, key,school);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFatherNumber="from Student where father_number = ? and school = ?";
		list = this.getHibernateTemplate().find(queryByFatherNumber, key,school);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByMothername="from Student where mother_name = ? and school = ?";
		list = this.getHibernateTemplate().find(queryByMothername, key,school);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByMotherNumber="from Student where mother_number = ? and school = ?";
		list = this.getHibernateTemplate().find(queryByMotherNumber, key,school);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByClassType = "from Student where class_type = ? and school = ?";
		list = this.getHibernateTemplate().find(queryByClassType, key,school);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	public List<Student> findStudentByKey(String key) {
		String query="from Student where name = ?";
		List<Student> list = this.getHibernateTemplate().find(query, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFathername="from Student where father_name = ?";
		list = this.getHibernateTemplate().find(queryByFathername, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByFatherNumber="from Student where father_number = ?";
		list = this.getHibernateTemplate().find(queryByFatherNumber, key);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryByMothername="from Student where mother_name = ?";
		list = this.getHibernateTemplate().find(queryByMothername, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByMotherNumber="from Student where mother_number = ?";
		list = this.getHibernateTemplate().find(queryByMotherNumber, key);
		if(list!=null&&list.size()>0){
			return list;
		}
		String queryBySchool="from Student where school = ?";
		list = this.getHibernateTemplate().find(queryBySchool, key);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
	public List<Student> findAllStudents(){
		String query = "from Student";
		return this.getHibernateTemplate().find(query);
	}
	public List<Student> findStudentByLimit(String key,Integer startIndex,Integer limit){
		String query = "from Student where school = :school";
		List<Student> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Student>(query,new Object[] {key},new String[] {"school"},startIndex,limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		String queryByClass="from Student where class_type = :class_type";
		list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<Student>(query,new Object[] {key},new String[] {"class_type"},startIndex,limit));
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}
}
