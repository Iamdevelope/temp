package com.gl.model;

public class TeacherBook {
	private Integer id;
	private String teacher_notes;//教师对绘本的笔记
	private String book_judge;//教师对绘本的文字评价
	private String time;
	private Integer score=0;//教师对绘本的评价分
	private Integer views=0;//该教案笔记被查看数
	
	private Teacher teacher;
	private Book book;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTeacher_notes() {
		return teacher_notes;
	}
	public void setTeacher_notes(String teacher_notes) {
		this.teacher_notes = teacher_notes;
	}
	public String getBook_judge() {
		return book_judge;
	}
	public void setBook_judge(String book_judge) {
		this.book_judge = book_judge;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
}
