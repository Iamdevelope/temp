package com.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.gl.model.Book;
import com.gl.model.Dean;
import com.gl.model.SoftwareCode;
import com.gl.service.SoftwareCodeService;
import com.gl.utils.PageBean;
import com.gl.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SoftwareCodeAction extends ActionSupport implements ModelDriven<SoftwareCode> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SoftwareCode softwareCode = new SoftwareCode();
	@Override
	public SoftwareCode getModel() {
		// TODO Auto-generated method stub
		return softwareCode;
	}
	private SoftwareCodeService softwareCodeService;
	private Integer page;
	private String deanName;
	private String computer_code;
	private Integer softwareid;
	
	
	public Integer getSoftwareid() {
		return softwareid;
	}
	public void setSoftwareid(Integer softwareid) {
		this.softwareid = softwareid;
	}
	public String getComputer_code() {
		return computer_code;
	}
	public void setComputer_code(String computer_code) {
		this.computer_code = computer_code;
	}
	public String getDeanName() {
		return deanName;
	}
	public void setDeanName(String deanName) {
		this.deanName = deanName;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		System.out.println("当前显示的页面："+page);
		this.page = page;
	}
	public SoftwareCodeService getSoftwareCodeService() {
		return softwareCodeService;
	}
	public void setSoftwareCodeService(SoftwareCodeService softwareCodeService) {
		this.softwareCodeService = softwareCodeService;
	}
	public SoftwareCode getSoftwareCode() {
		return softwareCode;
	}
	public void setSoftwareCode(SoftwareCode softwareCode) {
		this.softwareCode = softwareCode;
	}
	public String save() {
		Dean dean = softwareCodeService.findDeanByName(deanName);
		if(dean==null) {
			this.addActionError("添加失败，没有找到对应的院长用户。");
			return NONE;
		}
		softwareCode.setDean(dean);
		softwareCodeService.save(softwareCode);
		return "saveSuccess";
	}
	public String update() {
		softwareCodeService.update(softwareCode);
		return "updateSuccess";
	}
	public String info() {
		System.out.println("软件注册码id："+softwareid);
		softwareCode=softwareCodeService.findSoftwareById(softwareid);
		return "infoPage";
	}
	public String edit() {
		System.out.println("软件注册码id："+softwareid);
		softwareCode=softwareCodeService.findSoftwareById(softwareid);
		return "editPage";
	}
	public String findAllCode() {
		PageBean<SoftwareCode> pageBean = softwareCodeService.findAllCode(page);
		if(pageBean.getList().size()<=0) {
			this.addActionError("当前还没有软件注册码，请去添加！");
			return "findAllCode";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAllCode";
	}
	public String findCodeByDid() {
		Dean dean = softwareCodeService.findDeanByName(deanName);
		if(dean==null) {
			this.addActionError("查找失败，没有找到对应的院长用户。");
			return NONE;
		}
		PageBean<SoftwareCode> pageBean = softwareCodeService.findCodeByDid(page, dean.getDid());
		if(pageBean==null) {
			this.addActionError("当前该院长用户还没有添加对应得软件码");
			return "findCodeByDid";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findCodeByDid";
	}
	public String generateCode() throws IOException {
		System.out.println("当前需要注册的计算机码："+computer_code+"。所属的院长为："+deanName);
		Dean dean = softwareCodeService.findDeanByName(deanName);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(dean==null) {
			response.getWriter().println("需要添加的院长不存在，请确认输入内容是否正确。");
			//this.addActionError("需要添加的院长不存在，请确认输入内容是否正确。");
			return NONE;
		}
		SoftwareCode code = softwareCodeService.findCodeByComputerCode(computer_code,dean.getDid());
		if(code!=null) {
			response.getWriter().println("该计算机已经注册，请更换电脑进行添加！");
			return NONE;
		}
		String sC=UUIDUtils.getUUIDNoFormat();
		softwareCode.setComputerCode(computer_code);
		softwareCode.setDean(dean);
		softwareCode.setSoftwareCode(sC);
		softwareCodeService.save(softwareCode);
		response.getWriter().println("生成注册码成功！"+softwareCode.getSoftwareCode());
		return NONE;
	}
	public String updateCode() throws IOException {
		Dean dean = softwareCodeService.findDeanByName(deanName);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		SoftwareCode code = softwareCodeService.findCodeByComputerCode(computer_code,dean.getDid());
		if(code!=null) {
			response.getWriter().println("该计算机已经存在，不允许修改！");
			return NONE;
		}
		softwareCodeService.delete(softwareCode);
		String sC=UUIDUtils.getUUIDNoFormat();
		softwareCode.setComputerCode(computer_code);
		softwareCode.setDean(dean);
		softwareCode.setSoftwareCode(sC);
		softwareCodeService.update(softwareCode);
		response.getWriter().println("生成注册码成功！"+softwareCode.getSoftwareCode());
		return NONE;
	}
}