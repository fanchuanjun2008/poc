package com.yonyou.iuap.tepoc.entity;

import java.util.Date;
	

/**
 * mybatis方式
 */
public class TeBusilogVO {
	
	private String id;
	private String clientip;
	private String operuser;
	private String logcategory;
	private String logcontent;
	private String sysid;
	private String tenantid;
	private Date logdate;
	public TeBusilogVO() {
	}
    

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getClientip() {
		return this.clientip;
	}

	public void setClientip(String clientip) {
		this.clientip = clientip;
	}


	public String getOperuser() {
		return this.operuser;
	}

	public void setOperuser(String operuser) {
		this.operuser = operuser;
	}


	public String getLogcategory() {
		return this.logcategory;
	}

	public void setLogcategory(String logcategory) {
		this.logcategory = logcategory;
	}


	public String getLogcontent() {
		return this.logcontent;
	}

	public void setLogcontent(String logcontent) {
		this.logcontent = logcontent;
	}


	public String getSysid() {
		return this.sysid;
	}

	public void setSysid(String sysid) {
		this.sysid = sysid;
	}


	public String getTenantid() {
		return this.tenantid;
	}

	public void setTenantid(String tenantid) {
		this.tenantid = tenantid;
	}


	public Date getLogdate() {
		return this.logdate;
	}

	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}

}