package com.gl.model;

public class TeachingPlan {
	private Integer idteaching_plan;
	private String teaching_plan_name;
	private String teaching_path;
	private String book_class;
	private BookTheme booktheme;
	private Book book;
	private BookType booktype;
	public Integer getIdteaching_plan() {
		return idteaching_plan;
	}
	public void setIdteaching_plan(Integer idteaching_plan) {
		this.idteaching_plan = idteaching_plan;
	}
	public String getTeaching_plan_name() {
		return teaching_plan_name;
	}
	public void setTeaching_plan_name(String teaching_plan_name) {
		this.teaching_plan_name = teaching_plan_name;
	}
	public String getTeaching_path() {
		return teaching_path;
	}
	public void setTeaching_path(String teaching_path) {
		this.teaching_path = teaching_path;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public BookType getBooktype() {
		return booktype;
	}
	public void setBooktype(BookType bookType) {
		this.booktype = bookType;
	}
	public String getBook_class() {
		return book_class;
	}
	public void setBook_class(String book_class) {
		this.book_class = book_class;
	}
	public BookTheme getBooktheme() {
		return booktheme;
	}
	public void setBooktheme(BookTheme booktheme) {
		this.booktheme = booktheme;
	}
	
}
