package com.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Admin;
import com.gl.service.AdminService;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SuperManagerAction extends ActionSupport implements ModelDriven<Admin> {
	private Admin admin=new Admin();
	@Override
	public Admin getModel() {
		//System.out.println("获取到了管理员实例");
		return admin;
	}
	private AdminService adminService;
	public void setAdminService(AdminService adminService) {
		this.adminService=adminService;
	}
	public String execute() {		
		return "superManager";
	}
	private Integer aid;
	public void setAid(Integer aid) {
		Admin temp=(Admin)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(temp==null) {
			this.addActionError("登录过期，请重新登录！");
			return;
		}
		Integer id=temp.getAid();
		//System.out.println("获取到了管理员的ID："+id);
		this.aid=id;
	}
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode=checkcode;
	}
	private String pwd;
	private String newpwd;
	public void setPwd(String pwd) {
		this.pwd=pwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd=newpwd;
	}
	/*
	 * 管理员登录
	 * */
	public String superManagerIndex() {
		return "superManager";
	}
	/*
	 * 管理员页面
	 * */
	public String superManagerPage(){
		return "superManagerPage";
	}
	public String info() throws IOException {
		admin = (Admin)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		
		if(admin==null) {
			
			//this.addActionError("登录过期，请重新登录！");
			//System.out.println(ServletActionContext.getRequest().getContextPath()+"/WebContent/WEB-INF/jsp/superManagerIndex.jsp");
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/WebContent/WEB-INF/jsp/superManagerIndex.jsp");
			return LOGIN;
		}
		//System.out.println("管理员的ID："+admin.getAid());
		return "infoPage";
	}
	public String updatePassword() throws IOException {
		admin = (Admin)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//System.out.println("当前账号的密码："+admin.getPassword()+"********需要验证的密码："+pwd);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(!pwd.equals(admin.getPassword())) {
			//System.out.println("密码与数据库中密码不一致，更改密码失败");
			response.getWriter().println("密码错误");
			return NONE;
		}
		//System.out.println("设置的新密码为："+newpwd);
		admin.setPassword(newpwd);
		adminService.update(admin);
		response.getWriter().println("修改成功：当前登录账号即将失效，请使用新密码重新登录。");
		return NONE;
	}
	public String updatePasswordPage() {
		return "updatePassword";
	}
	public String forgetPassword() {
		return "forgetPassword";
	}
	public String edit() {
		admin=(Admin)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//System.out.println("当前退出的用户管理员的ID："+admin.getAid());
		return "editPage";
	}
	public String update() {
		adminService.update(admin);
		//System.out.println("*****更新用户信息成功*****");
		return "updateSuccess";
	}
	/*
	 * 管理员新增页面
	 * */
	public String addPage() {
		return "addPage";
	}
	public String login() {
		this.clearActionErrors();
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误!");
			return LOGIN;
		}
		Admin existAdmin=adminService.login(admin);
		if(existAdmin==null) {
			//System.out.println("登录失败");
			this.addActionError("登录失败：用户名或密码错误！");
			return LOGIN;
		}
		else if(existAdmin.getLogin_state()==1) {
			//System.out.println("登录失败，用户已经登录。");
			this.addActionError("登录失败：用户已经登录");
			return LOGIN;
		}
		else {
			//System.out.println("当前时间："+TimeHelper.getCurrentTime());
			//当用户登录成功时，记录用户的此次登录的时间以及将登录次数自增
			int count = existAdmin.getLogin_count();
			existAdmin.setLogin_count(count+1);
			existAdmin.setLast_login_time(TimeHelper.getCurrentTime());
			//existAdmin.setLogin_state(1);
			admin=existAdmin;
			adminService.update(existAdmin);
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existAdmin);
			//System.out.println("登录成功");
			return "loginSuccess";
		}
	}

	/*
	 * 退出
	 * */
	public void quit() {
		Admin admin = (Admin)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//admin.setLogin_state(0);
		//System.out.println("退出成功，将该用户的登录状态更改。");
		adminService.update(admin);
		ServletActionContext.getRequest().getSession().removeAttribute("existAdmin");
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
	}
}
