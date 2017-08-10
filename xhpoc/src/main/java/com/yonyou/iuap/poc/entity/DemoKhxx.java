package com.yonyou.iuap.poc.entity;



/**
 * mybatis方式
 */
public class DemoKhxx {

	private String pk;
	private String khbh;
	private String khmc;
	private String kyzt;
	public DemoKhxx() {
	}
    

	public String getKhbh() {
		return this.khbh;
	}

	public void setKhbh(String khbh) {
		this.khbh = khbh;
	}


	public String getKhmc() {
		return this.khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}


	public String getKyzt() {
		return this.kyzt;
	}

	public void setKyzt(String kyzt) {
		this.kyzt = kyzt;
	}

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}
}