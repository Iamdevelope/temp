package com.gl.model;

import java.util.HashSet;
import java.util.Set;

public class Book {
	private Integer bid;
	private String name;//绘本名字
	private String book_type;//绘本类型
	private String book_class;//绘本所属班级类型
	private String book_path;//绘本路径
	private String book_theme;//绘本主题
	private Integer book_used_time=0;//绘本被使用时长
	private String addtime;
	private String book_abstract;//绘本简介
	private Integer book_used_count=0;//绘本被使用次数
	private Integer isdelete=0;//绘本是否可以使用
	private Integer score=0;//绘本综合评分
	private Integer isadd=1;//判断该本书是否被教师使用0表示已经被使用，1表示未被使用
	private String video_path;//绘本中的视频路径
	private String resources_path;//绘本的资源下载路径
	private Integer type;
	private String bookImg_path;//绘本中所有的绘本页面图片路径
	private Set<Teacher> teacher=new HashSet<Teacher>();
	private Set<TeacherBook> teacherbook = new HashSet<TeacherBook>();
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer id) {
		this.bid = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	public String getBook_class() {
		return book_class;
	}
	public void setBook_class(String book_class) {
		this.book_class = book_class;
	}
	public String getBook_path() {
		return book_path;
	}
	public void setBook_path(String book_path) {
		this.book_path = book_path;
	}
	public String getBook_theme() {
		return book_theme;
	}
	public void setBook_theme(String book_theme) {
		this.book_theme = book_theme;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String book_addtime) {
		this.addtime = book_addtime;
	}
	public Integer getBook_used_time() {
		return book_used_time;
	}
	public void setBook_used_time(Integer book_used_time) {
		this.book_used_time = book_used_time;
	}
	public String getBook_abstract() {
		return book_abstract;
	}
	public void setBook_abstract(String book_abstract) {
		this.book_abstract = book_abstract;
	}
	public Integer getBook_used_count() {
		return book_used_count;
	}
	public void setBook_used_count(Integer book_used_count) {
		this.book_used_count = book_used_count;
	}
	public Integer getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Set<Teacher> getTeacher() {
		return teacher;
	}
	public void setTeacher(Set<Teacher> teacher) {
		this.teacher = teacher;
	}
	
	public Set<TeacherBook> getTeacherbook() {
		return teacherbook;
	}
	public void setTeacherbook(Set<TeacherBook> teacherbook) {
		this.teacherbook = teacherbook;
	}
	public Integer getIsadd() {
		return isadd;
	}
	public void setIsadd(Integer isadd) {
		this.isadd = isadd;
	}
	public String getVideo_path() {
		return video_path;
	}
	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}
	
	public String getResources_path() {
		return resources_path;
	}
	public void setResources_path(String resources_path) {
		this.resources_path = resources_path;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getBookImg_path() {
		return bookImg_path;
	}
	public void setBookImg_path(String bookImg_path) {
		this.bookImg_path = bookImg_path;
	}
	
}
