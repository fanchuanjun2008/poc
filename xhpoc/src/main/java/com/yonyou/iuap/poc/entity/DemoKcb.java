package com.yonyou.iuap.poc.entity;



/**
 * mybatis方式
 */
public class DemoKcb {

	private String pk;
	private String ywbm;
	private String pzbm;
	private Integer kcsl;
	private Integer kczk;
	private String kczt;
	public DemoKcb() {
	}
    

	public String getYwbm() {
		return this.ywbm;
	}

	public void setYwbm(String ywbm) {
		this.ywbm = ywbm;
	}


	public String getPzbm() {
		return this.pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}


	public Integer getKcsl() {
		return this.kcsl;
	}

	public void setKcsl(Integer kcsl) {
		this.kcsl = kcsl;
	}


	public Integer getKczk() {
		return this.kczk;
	}

	public void setKczk(Integer kczk) {
		this.kczk = kczk;
	}


	public String getKczt() {
		return this.kczt;
	}

	public void setKczt(String kczt) {
		this.kczt = kczt;
	}

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}
}