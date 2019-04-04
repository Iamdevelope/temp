package com.gl.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Teacher;
import com.gl.model.User;
import com.gl.service.DeanService;
import com.gl.service.TeacherService;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private DeanService deanService;
	private TeacherService teacherService;
	private String checkcode;
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public DeanService getDeanService() {
		return deanService;
	}
	public void setDeanService(DeanService deanService) {
		this.deanService = deanService;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String execute() {
		return "user";
	}
	public String login() {
		//System.out.println("正在登录。。。");
		this.clearActionErrors();
		HttpServletRequest request = ServletActionContext.getRequest();
		String checkcode1 = (String) request.getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误!");
			return LOGIN;
		}
		System.out.println(user.getIdentity());
		if(user.getIdentity().equals("dean")) {
			Dean dean = new Dean();
			dean.setName(user.getName());
			dean.setPassword(user.getPassword());
			Dean existDean = deanService.login(dean);
			if(existDean==null) {
				this.addActionError("登录失败：用户名或秘密错误！");
				return LOGIN;
			}else if(existDean.getIsdelete()==1) {
				this.addActionError("登录失败：该用户已经被注销，不能再使用，如有疑问，请联系管理员！");
				return LOGIN;
			}
			else if(existDean.getLogin_state()==1) {
				this.addActionError("登录失败：该用户已经登录！");
				return LOGIN;
			}
			else{
				Integer count=existDean.getLogin_count();
				if(count==null) {
					existDean.setLogin_count(1);
				}else {
					existDean.setLogin_count(count+1);
				}
				existDean.setLast_login_time(TimeHelper.getCurrentTime());
				existDean.setLogin_state(1);
				deanService.update(existDean);
				ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existDean);
				//System.out.println("login success");
				return "dean";
			}
		}else if(user.getIdentity().equals("teacher")) {
			Teacher teacher = new Teacher();
			teacher.setName(user.getName());
			teacher.setPassword(user.getPassword());
			Teacher existTeacher = teacherService.login(teacher);
			if(existTeacher==null) {
				this.addActionError("登录失败：用户名或密码错误。");
				//System.out.println("教师登录失败：用户名或密码错误。");
				return LOGIN;
			}
			else if(existTeacher.getIsdelete()==1) {
				this.addActionError("登录失败：该用户已经被注销，不可再使用，如有疑问，请联系管理员。");
				return LOGIN;
			}
			else if(existTeacher.getLogin_state()==1) {
				this.addActionError("登录失败：该用户已经登录！");
				return LOGIN;
			}
			else {
				//当用户登录成功时，记录用户的此次登录的时间以及将登录次数自增
				Integer count = existTeacher.getLogin_count();
				if(count==null) {
					existTeacher.setLogin_count(1);
				}else {
					existTeacher.setLogin_count(count+1);
				}
				existTeacher.setLast_login_time(TimeHelper.getCurrentTime());
				existTeacher.setLogin_state(1);
				teacherService.update(existTeacher);
				ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existTeacher);
				//System.out.println("登录成功");
				return "teacher";
			}
		}else {
			return LOGIN;
		}
	}
	/*
	 * 退出
	 * */
	public void quit() {
		
	}
}