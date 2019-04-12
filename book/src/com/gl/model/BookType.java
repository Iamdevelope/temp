package com.gl.model;

import java.util.HashSet;
import java.util.Set;

/*
 * 绘本类型实体类
 */
public class BookType {
	private Integer idbooktype;
	private String book_type_name;
	private String description;
	private Set<Book> book = new HashSet<Book>();
	private Set<TeachingPlan> teachingPlan = new HashSet<TeachingPlan>();
	public Integer getIdbooktype() {
		return idbooktype;
	}
	public void setIdbooktype(Integer id) {
		this.idbooktype = id;
	}
	public String getBook_type_name() {
		return book_type_name;
	}
	public void setBook_type_name(String book_type_name) {
		this.book_type_name = book_type_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<Book> getBook() {
		return book;
	}
	public void setBook(Set<Book> book) {
		this.book = book;
	}
	public Set<TeachingPlan> getTeachingPlan() {
		return teachingPlan;
	}
	public void setTeachingPlan(Set<TeachingPlan> teachingPlan) {
		this.teachingPlan = teachingPlan;
	}
	
}
