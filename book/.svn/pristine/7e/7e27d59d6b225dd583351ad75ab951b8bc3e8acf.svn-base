package com.gl.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Dean;
import com.gl.model.Manager;
import com.gl.service.DeanService;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*
 * 后台管理员管理院长Action
 * */
public class DeanSuperManagerAction extends ActionSupport implements ModelDriven<Dean> {
	private Dean dean=new Dean();
	@Override
	public Dean getModel() {
		return dean;
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
		this.select=select;
	}
	public String save() {
		Manager manager=(Manager)ServletActionContext.getRequest().getSession().getAttribute("existAdmin");
		if(manager==null) {
			this.addActionError("登录过时，请重新登录！");
			return NONE;
		}
		dean.setManager(manager);
		dean.setCreate_time(TimeHelper.getCurrentTime());
		deanService.save(dean);
		return "saveSuccess";
	}
	public String editPage() {
		dean=deanService.findDeanById(dean.getDid());
		return "editPage";
	}
	public String update() {
		System.out.println("更新院长用户时，院长的名字："+dean.getName());
		deanService.update(dean);
		return "updateSuccess";
	}
	public String delete() {
		deanService.delete(dean);
		return "deleteSuccess";
	}
	public String findDeanAll() {
		PageBean<Dean> pageBean=deanService.findAllDean(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findDeanAll";
	}
	public String addPage() {
		List<Dean> dlist = deanService.findAllDean();
		ActionContext.getContext().getValueStack().set("dlist", dlist);
		return "addPage";
	}
	public String importPage() {
		return "importPage";
	}
	public String info() {
		dean=deanService.findDeanById(dean.getDid());
		return "infoPage";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findDeanAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Dean> pageBean = deanService.selectDeanByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findDeanAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
}
