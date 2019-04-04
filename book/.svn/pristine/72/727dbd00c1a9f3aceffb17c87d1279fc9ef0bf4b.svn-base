package com.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Manager;
import com.gl.service.ManagerService;
import com.gl.utils.TimeHelper;
import com.gl.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Manager manager=new Manager();
	@Override
	public Manager getModel() {
		//System.out.println("获取到了管理员实例");
		return manager;
	}
	private String pwd;
	private String newpwd;
	public void setPwd(String pwd) {
		this.pwd=pwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd=newpwd;
	}
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService=managerService;
	}
	public String execute() {		
		return "manager";
	}
	/*
	 * 管理员登录
	 * */
	public String managerIndex() {
		return "manager";
	}
	/*
	 * 管理员登录页面
	 * */
	public String managerPage(){
		return "managerPage";
	}
	/*
	 * 管理员新增页面
	 * */
	public String addPage() {
		return "addPage";
	}
	public String login() {
		Manager existAdmin=managerService.login(manager);
		if(existAdmin==null) {
			//System.out.println("登录失败");
			this.addActionError("登录失败：用户名或密码错误！");
			return LOGIN;
		}
		else if(existAdmin.getIsdelete()==1) {
			//System.out.println("当前管理员类型："+existAdmin.getPower());
			this.addActionError("登录失败：该用户已经被注销，不能再使用，如有疑问，请联系管理员！");
			return LOGIN;
		}
		else if(existAdmin.getLogin_state()==1) {
			this.addActionError("登录失败：该用户已经登录！");
			return LOGIN;
		}
		else {
			//System.out.println("当前时间："+TimeHelper.getCurrentTime());
			//当用户登录成功时，记录用户的此次登录的时间以及将登录次数自增
			Integer count = existAdmin.getLogin_count();
			if(count==null) {
				existAdmin.setLogin_count(1);
			}else {
				existAdmin.setLogin_count(count+1);
			}
			existAdmin.setLast_login_time(TimeHelper.getCurrentTime());
			existAdmin.setLogin_state(1);
			managerService.update(existAdmin);
			ServletActionContext.getRequest().getSession().setAttribute("existAdmin", existAdmin);
			//System.out.println("登录成功");
			return "loginSuccess";
		}
	}
	public String regist() {
		String code=UUIDUtils.getUUID();
		manager.setCode(code);
		manager.setCreate_time(TimeHelper.getCurrentTime());
		managerService.save(manager);
		return "msg";
	}
	public String info() {
		manager = (Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		
		if(manager==null) {
			this.addActionError("登录过期，请重新登录！");
		}
		//System.out.println("院长的ID："+manager.getMid());
		return "infoPage";
	}
	public String updatePassword() throws IOException {
		manager = (Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		//System.out.println("当前账号的密码："+manager.getPassword()+"********需要验证的密码："+pwd);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(!pwd.equals(manager.getPassword())) {
			//System.out.println("密码与数据库中密码不一致，更改密码失败");
			response.getWriter().println("密码错误");
			return NONE;
		}
		//System.out.println("设置的新密码为："+newpwd);
		manager.setPassword(newpwd);
		managerService.update(manager);
		response.getWriter().println("修改成功：当前登录账号即将失效，请使用新密码重新登录。");
		return NONE;
	}
	public String updatePasswordPage() {
		return "updatePassword";
	}
	public String editPage() {
		manager=(Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		return "editPage";
	}
	public String edit() {
		Manager temp=(Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		manager.setPassword(temp.getPassword());
		manager.setCode(temp.getCode());
		manager.setType(temp.getType());
		//System.out.println("***********"+manager.getPassword());
		managerService.update(manager);
		return "infoPage";
	}
	public String update() {
		managerService.update(manager);
		return "updateSuccess";
	}
	/*
	 * 退出
	 * */
	public void quit() {
		Manager m = (Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		m.setLogin_state(0);
		managerService.update(m);
				
		ServletActionContext.getRequest().getSession().removeAttribute("existAdmin");
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
	}
}
