package com.gl.action;



import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Student;
import com.gl.service.StudentService;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentDeanAction extends ActionSupport implements ModelDriven<Student> {
	private Student student=new Student();
	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return student;
	}
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService=studentService;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private String select;
	public void setSelect(String select){
		System.out.println("设置的关键字为："+select);
		this.select=select;
	}
	public String findStudentAll() {
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		System.out.println("当前教师所属学校："+dean.getSchool());
		PageBean<Student> pageBean=studentService.selectStudentByKey(dean.getSchool(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findStudentAll";
	}
	public String info() {
		student=studentService.findStudentById(student.getSid());
		return "infoPage";
	}
	public String edit() {
		student=studentService.findStudentById(student.getSid());
		return "editPage";
	}
	public String addPage() {
		return "addPage";
	}
	public String save(){
		student.setCreate_time(TimeHelper.getCurrentTime());
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		student.setSchool(dean.getSchool());
		studentService.save(student);
		return "saveSuccess";
	}
	public String update() {
		studentService.update(student);
		return "updateSuccess";
	}
	public String select(){
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		System.out.println("当前教师所属学校："+dean.getSchool());
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findStudentAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Student> pageBean = studentService.selectStudentByKey(select,dean.getSchool(), page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findStudentAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	
}
