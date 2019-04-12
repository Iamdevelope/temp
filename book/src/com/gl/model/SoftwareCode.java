package com.gl.model;

public class SoftwareCode {
	private Integer softwareId;
	private String softwareCode;
	private String computerCode;
	private Integer used = 0;//是否被使用  0表示还未被使用，1表示已使用
	private String time;//有效期
	private String addtime;
	private Dean dean;
	public Integer getSoftwareId() {
		return softwareId;
	}
	public void setSoftwareId(Integer softwareId) {
		this.softwareId = softwareId;
	}
	public String getSoftwareCode() {
		return softwareCode;
	}
	public void setSoftwareCode(String softwareCode) {
		this.softwareCode = softwareCode;
	}
	public String getComputerCode() {
		return computerCode;
	}
	public void setComputerCode(String computerCode) {
		this.computerCode = computerCode;
	}
	public Dean getDean() {
		return dean;
	}
	public void setDean(Dean dean) {
		this.dean = dean;
	}
	public Integer getUsed() {
		return used;
	}
	public void setUsed(Integer used) {
		this.used = used;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	
}
