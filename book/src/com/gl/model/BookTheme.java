package com.gl.model;

import java.util.HashSet;
import java.util.Set;

/*
 * 绘本主题实体类
 * */
public class BookTheme {
	private Integer idbooktheme;
	private String theme_name;
	private String theme_description;
	private String class_type;
	private String term;//表示的是主题属于哪个学期
	private Set<Book> book = new HashSet<Book>();
	private Set<TeachingPlan> teachingplan = new HashSet<TeachingPlan>();
	public Integer getIdbooktheme() {
		return idbooktheme;
	}
	public void setIdbooktheme(Integer idbooktheme) {
		this.idbooktheme = idbooktheme;
	}
	public String getTheme_name() {
		return theme_name;
	}
	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}
	public String getTheme_description() {
		return theme_description;
	}
	public void setTheme_description(String theme_description) {
		this.theme_description = theme_description;
	}
	public Set<Book> getBook() {
		return book;
	}
	public void setBook(Set<Book> book) {
		this.book = book;
	}
	public String getClass_type() {
		return class_type;
	}
	public void setClass_type(String class_type) {
		this.class_type = class_type;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public Set<TeachingPlan> getTeachingplan() {
		return teachingplan;
	}
	public void setTeachingplan(Set<TeachingPlan> teachingplan) {
		this.teachingplan = teachingplan;
	}
	
}
