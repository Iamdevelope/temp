package com.gl.action;



import org.apache.struts2.ServletActionContext;

import com.gl.model.Teacher;
import com.gl.model.TeacherBook;
import com.gl.service.TeacherBookService;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 绘本教案Action
 * */
public class TeacherBookAction extends ActionSupport implements ModelDriven<TeacherBook> {
	private TeacherBook teacherbook=new TeacherBook();
	@Override
	public TeacherBook getModel() {
		return teacherbook;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private TeacherBookService teacherBookService;
	public void setTeacherBookService(TeacherBookService teacherBookService) {
		this.teacherBookService = teacherBookService;
	}
	public String update() {
		teacherBookService.update(teacherbook);
		return "updateSuccess";
	}
	public String save() {
		Teacher teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(teacher==null) {
			this.addActionError("您还没有登录！");
			return NONE;
		}
		teacherbook.setTeacher(teacher);
		teacherBookService.save(teacherbook);
		return "saveSuccess";
	}
	public String add() {
		return "addPage";
	}
	public String delete() {
		teacherBookService.delete(teacherbook);
		return "deleteSuccess";
	}
	public String findAllTeacherBook() {
		PageBean<TeacherBook> pageBean = teacherBookService.findAll(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllTeacherBook";
	}
	/*
	 * 通过教师id获取该教师所有的教案
	 * */
	public String findTeacherBooksByTid() {
		PageBean<TeacherBook> pageBean = teacherBookService.findTeacherBooksByTid(teacherbook.getTeacher().getTid(), page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findSuccess";
	}
	/*
	 * 通过绘本id获取该绘本所有的教案
	 * */
	public String findTeacherBooksByBid() {
		PageBean<TeacherBook> pageBean = teacherBookService.findTeacherBooksByBid(teacherbook.getBook().getBid(), page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findSuccess";
	}
}
