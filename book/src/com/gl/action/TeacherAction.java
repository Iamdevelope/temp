package com.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Teacher;
import com.gl.service.TeacherService;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherAction extends ActionSupport implements ModelDriven<Teacher> {
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
	private Integer tid;
	public void setTid(Integer tid) {
		this.tid=tid;
	}
	private String pwd;
	private String newpwd;
	public void setPwd(String pwd) {
		this.pwd=pwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd=newpwd;
	}
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode=checkcode;
	}
	//账号激活
	public String active() {
		
		return "msg";
	}
	public String execute() {
		return "teacher";
	}
	/*
	 * 跳转登录界面
	 * */
	public String loginPage() {
		return "loginPage";
	}
	/*
	 * 跳转注册界面
	 * */
	public String registPage() {
		return "registPage";
	}
	public String teacherPage() {
		return "teacherPage";
	}
	/*
	 * 登录
	 * */
	public String login() {
		//System.out.println("正在登录。。。");
		this.clearActionErrors();
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
//		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
//		if(!checkcode.equalsIgnoreCase(checkcode1)){
//			this.addActionError("验证码输入错误!");
//			return LOGIN;
//		}
		Teacher existTeacher=teacherService.login(teacher);
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
			//existTeacher.setLogin_state(1);
			teacherService.update(existTeacher);
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existTeacher);
			//System.out.println("登录成功");
			return "loginSuccess";
		}
	}
	public String regist() {
		Dean dean = (Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(dean==null) {
			this.addActionError("登录过期，请重新登录！");
			return NONE;
		}
		teacher.setDean(dean);
		teacherService.save(teacher);
		return "registSuccess";
	}
	public String info() {
		teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		
		if(teacher==null) {
			this.addActionError("登录过期，请重新登录！");
			return NONE;
		}
		//System.out.println("教师的ID："+teacher.getTid());
		return "infoPage";
	}
	public String updatePassword() throws IOException {
		teacher = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//System.out.println("当前账号的密码："+teacher.getPassword()+"********需要验证的密码："+pwd);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(!pwd.equals(teacher.getPassword())) {
			//System.out.println("密码与数据库中密码不一致，更改密码失败");
			response.getWriter().println("密码错误");
			return NONE;
		}
		//System.out.println("设置的新密码为："+newpwd);
		teacher.setPassword(newpwd);
		teacherService.update(teacher);
		response.getWriter().println("修改成功：当前登录账号即将失效，请使用新密码重新登录。");
		return NONE;
	}
	public String updatePasswordPage() {
		return "updatePassword";
	}
	public String edit() {
		Teacher temp = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		teacher.setPassword(temp.getPassword());
		teacherService.update(teacher);
		//System.out.println("修改完成个人信息,修改好的教师的学校："+teacher.getSchool());
		return "infoPage";
	}
	public String editPage() {		
		teacher=(Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//System.out.println("管理员的ID："+teacher.getTid());
		return "editPage";
	}
	/*
	 * 退出
	 * */
	public void quit() {
		Teacher t = (Teacher)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//t.setLogin_state(0);
		teacherService.update(t);
		System.out.println("教师用户退出了系统了");
		ServletActionContext.getRequest().getSession().removeAttribute("existAdmin");
		ServletActionContext.getRequest().getSession().invalidate();
	}
}
