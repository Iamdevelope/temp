package com.gl.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.gl.model.*;
import com.gl.service.TeacherService;
import com.gl.utils.PageBean;

/*
 * 后台管理员管理教师Action
 * */
public class TeacherSuperManagerAction extends ActionSupport implements ModelDriven<Teacher> {
	private Teacher teacher=new Teacher();
	@Override
	public Teacher getModel() {
		// TODO Auto-generated method stub
		return teacher;
	}
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService=teacherService;
	}
	private String select;
	public void setSelect(String select){
		System.out.println("设置的搜索关键字为："+select);
		this.select=select;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	public String delete() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		teacher.setIsdelete(1);
		teacherService.update(teacher);
		return "deleteSuccess";
	}
	public String findTeacherAll() {
		PageBean<Teacher> pageBean=teacherService.findAllTeachers(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findTeacherAll";
	}
	public String editPage() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		return "editPage";
	}
	public String edit() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		return "updateSuccess";
	}
	public String update() {
		System.out.println("更新用户完成，更新教师的ID："+teacher.getTid()+",教师的姓名："+teacher.getName());
		teacherService.update(teacher);
		return "updateSuccess";
	}
	public String info() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		return "infoPage";
	}
	public String addPage() {
		return "addPage";
	}
	/*
	 * 查找
	 * */
	public String select() {
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findTeacherAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Teacher> pageBean = teacherService.selectTeacherByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findTeacherAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
}
