package com.gl.action;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Student;
import com.gl.model.Teacher;
import com.gl.service.StudentService;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentSuperManagerAction extends ActionSupport implements ModelDriven<Student> {
	private Student student = new Student();
	@Override
	public Student getModel() {
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
		//String s = (String)ActionContext.getContext().get("select");
		String s = (String)ServletActionContext.getRequest().getAttribute("select");
		PageBean<Student> pageBean = new PageBean<Student>();
		if(s!=null) {
			System.out.println("当前需要符合的条件为："+s);
			pageBean=studentService.selectStudentByKey(s, page);
		}
		else {
			pageBean=studentService.findStudentByPage(page);
		}
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
		studentService.save(student);
		return "saveSuccess";
	}
	public String update() {
		studentService.update(student);
		return "updateSuccess";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findStudentAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		ActionContext.getContext().getValueStack().set("select", select);
		ServletActionContext.getRequest().setAttribute("select", select);
		PageBean<Student> pageBean = studentService.selectStudentByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findStudentAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
}
