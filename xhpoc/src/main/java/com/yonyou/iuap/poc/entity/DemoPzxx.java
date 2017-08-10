package com.yonyou.iuap.poc.entity;

import java.util.Date;
	

/**
 * mybatis方式
 */
public class DemoPzxx {

	private String pk;
	private String pzbm;
	private String isbn;
	private String sm;
	private Integer dj;
	private Date cbrq;
	private Date ysny;
	public DemoPzxx() {
	}
    

	public String getPzbm() {
		return this.pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}


	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public String getSm() {
		return this.sm;
	}

	public void setSm(String sm) {
		this.sm = sm;
	}


	public Integer getDj() {
		return this.dj;
	}

	public void setDj(Integer dj) {
		this.dj = dj;
	}


	public Date getCbrq() {
		return this.cbrq;
	}

	public void setCbrq(Date cbrq) {
		this.cbrq = cbrq;
	}


	public Date getYsny() {
		return this.ysny;
	}

	public void setYsny(Date ysny) {
		this.ysny = ysny;
	}

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}
}