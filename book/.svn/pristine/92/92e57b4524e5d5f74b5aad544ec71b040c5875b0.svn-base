package com.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Manager;
import com.gl.service.DeanService;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 院长Action
 * */
public class DeanAction extends ActionSupport implements ModelDriven<Dean> {
	private Dean dean=new Dean();
	public Dean getModel() {
		return dean;
	}
	private DeanService deanService;
	public void setDeanService(DeanService deanService) {
		this.deanService=deanService;
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
	
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String execute() {
		return "deanIndex";
	}
	public String registPage() {
		return "registPage";
	}
	public String deanPage() {
		return "deanPage";
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
		Dean existDean=deanService.login(dean);
		if(existDean==null) {
			this.addActionError("登录失败：用户名或密码错误。");
			System.out.println("登录失败：用户名或密码错误。from dean action ");
			return LOGIN;
		}
		else if(existDean.getIsdelete()==1) {
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
			System.out.println("login success");
			return "loginSuccess";
		}
	}
	public String regist() {
		Manager manager = (Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		System.out.println("当前登陆的管理员姓名："+manager.getName());
		dean.setManager(manager);
		dean.setCreate_time(TimeHelper.getCurrentTime());
		deanService.save(dean);
		return "registSuccess";
	}
	public String info() {
		dean = (Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		
		if(dean==null) {
			this.addActionError("登录过期，请重新登录！");
		}
		System.out.println("院长的ID："+dean.getDid());
		return "infoPage";
	}
	public String updatePassword() throws IOException {
		dean = (Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		System.out.println("当前账号的密码："+dean.getPassword()+"********需要验证的密码："+pwd);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(!pwd.equals(dean.getPassword())) {
			System.out.println("密码与数据库中密码不一致，更改密码失败");
			response.getWriter().println("密码错误");
			return NONE;
		}
		System.out.println("设置的新密码为："+newpwd);
		dean.setPassword(newpwd);
		deanService.update(dean);
		response.getWriter().println("修改成功：当前登录账号即将失效，请使用新密码重新登录。");
		return NONE;
	}
	public String edit() {
		Dean temp=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		dean.setManager(temp.getManager());
		dean.setPassword(temp.getPassword());
		dean.setLogin_count(temp.getLogin_count());
		dean.setRegisted_count(temp.getRegisted_count());
		dean.setCan_regist_count(temp.getCan_regist_count());
		dean.setArea(temp.getArea());
		deanService.update(dean);
		return "infoPage";
	}
	public String editPage() {
		dean=(Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		return "editPage";
	}
	public String updatePasswordPage() {
		return "updatePassword";
	}
	public void quit() {
		Dean dean = (Dean)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		dean.setLogin_state(0);
		System.out.println("退出成功，将该用户的登录状态更改。");
		deanService.update(dean);
		ServletActionContext.getRequest().getSession().removeAttribute("existAdmin");
		ServletActionContext.getRequest().getSession().invalidate();
	}
}
