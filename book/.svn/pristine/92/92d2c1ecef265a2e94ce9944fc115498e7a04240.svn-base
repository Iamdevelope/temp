package com.gl.action;



import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Teacher;
import com.gl.service.DeanService;
import com.gl.service.TeacherService;
import com.gl.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherDeanAction extends ActionSupport implements ModelDriven<Teacher> {
	private Teacher teacher = new Teacher();
	@Override
	public Teacher getModel() {
		// TODO Auto-generated method stub
		return teacher;
	}
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService=teacherService;
	}
	private DeanService deanService;
	public void setDeanService(DeanService deanService) {
		this.deanService=deanService;
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
	public String findTeacherAll() {
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		System.out.println("当前教师所属学校："+teacher.getSchool());
		PageBean<Teacher> pageBean=teacherService.findTeacherByPage(dean.getSchool(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findTeacherAll";
	}
	public String info() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		return "infoPage";
	}
	public String editPage() {
		teacher=teacherService.findTeacherById(teacher.getTid());
		return "editPage";
	}
	public String addPage() {
		return "addPage";
	}
	public String update() {
		teacherService.update(teacher);
		return "updateSuccess";
	}
	public String select(){
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}System.out.println("当前教师所属学校："+dean.getSchool());
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findTeacherAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Teacher> pageBean = teacherService.selectTeacherByKey(select,dean.getSchool(), page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findTeacherAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	public String regist() {
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		dean.setRegisted_count(dean.getRegisted_count()+1);
		if(dean.getRegisted_count()>dean.getCan_regist_count()) {
			this.addActionError("您添加的教师数量已达上限，如有疑问请联系管理员！");
			return NONE;
		}
		deanService.update(dean);
		teacher.setDean(dean);
		teacher.setSchool(dean.getSchool());
		teacherService.save(teacher);
		return "registSuccess";
	}
	public String delete() {
		Dean dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		dean.setRegisted_count(dean.getRegisted_count()-1);
		deanService.update(dean);
		teacherService.delete(teacher);
		return "deleteSuccess";
	}
}
