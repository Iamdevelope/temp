package com.gl.action;


import java.util.Calendar;
import java.util.Date;

import com.gl.model.SoftwareCode;
import com.gl.service.SoftwareCodeService;
import com.gl.utils.TimeHelper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SoftwareCodeDeanAction extends ActionSupport implements ModelDriven<SoftwareCode> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SoftwareCode softwareCode = new SoftwareCode();
	private SoftwareCodeService softwareCodeService;
	@Override
	public SoftwareCode getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	public SoftwareCode getSoftwareCode() {
		return softwareCode;
	}
	public void setSoftwareCode(SoftwareCode softwareCode) {
		this.softwareCode = softwareCode;
	}
	
	public SoftwareCodeService getSoftwareCodeService() {
		return softwareCodeService;
	}
	public void setSoftwareCodeService(SoftwareCodeService softwareCodeService) {
		this.softwareCodeService = softwareCodeService;
	}
	public String save() {
		softwareCodeService.save(softwareCode);
		return "saveSuccess";
	}
	public String update() {
		softwareCodeService.update(softwareCode);
		return "updateSuccess";
	}
	/*
	 * 生成计算机激活码
	 * */
	private void generateCode() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DATE);
		int hour = calendar.get(Calendar.HOUR);
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);
		System.out.println("year: "+year+" month: "+month+" day: "+day+" hour: "+hour+" minute: "+minute+" second: "+second);
	}
}
